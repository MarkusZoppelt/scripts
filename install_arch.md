
Partition the disk

`cfdisk /dev/sda`

chose `dos`

After that create boot loader partition:

`New-> Partition Size: 200M -> primary -> Bootable`

The last one will be the root partition. Use free space

`New-> Partition Size: xxxGB -> primary`

Write the changes and quit from cfdisk.

Create cryptographic device mapper device in LUKS encryption mode:

`cryptsetup --verbose --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random luksFormat /dev/sda2`

Unlock the partition, note that cryptroot will be the device mapper name that we will operate on.

`cryptsetup open --type luks /dev/sda2 cryptroot`

Create the boot and root file systems:

`mkfs.ext4 /dev/sda1`

`mkfs.ext4 /dev/mapper/cryptroot`

Mount them:

`mount -t ext4 /dev/mapper/cryptroot /mnt`

`mkdir -p /mnt/boot`

`mount -t ext4 /dev/sda1 /mnt/boot`

Install the base and base-devel systems, DE + some other tools:

`pacstrap -i /mnt base base-devel linux linux-firmware gdm gnome networkmanager vim zsh git`

Generate the fstab:

`genfstab -U -p /mnt >> /mnt/etc/fstab`

Chroot to configure the base system:

`arch-chroot /mnt`

Uncomment the en_US locale:

`sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen`

Generate the locale:

`locale-gen`

`echo LANG=en_US.UTF-8 > /etc/locale.conf`

Export the locale

`export LANG=en_US.UTF-8`

Create a symbolic link with the desired time zone:

`ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime`

Set the hardware clock to UTC:

`hwclock --systohc --utc`

Set the desired hostname:

`echo Arch > /etc/hostname`

Set the root password:

`passwd`

Add a system user:

`useradd -m -g users -G wheel,audio,video -s /bin/zsh mz`

Set the system user password:

`passwd mz`

Install sudo (base-devel) and the boot loader grub:

`pacman -S sudo grub-bios`

Allow the system user to use sudo and run commands (temporary) as root:

`EDITOR=vim visudo` and uncomment the following line:

`wheel = (ALL) ALL

Add the following kernel parameter to be able to unlock your LUKS encrypted root partition during system startup in `/etc/default/grub`:

`GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda2:cryptroot"`

Add encrypt hook in `/etc/mkinitcpio.conf`:

`HOOKS ="base udev autodetect modconf block encrypt filesystems keyboard fsck`

Re-generate initrams image (ramdisk):

`mkinitcpio -p linux`

Install grub and save it's configuration file:

`grub-install --recheck /dev/sda`

`grub-mkconfig --output /boot/grub/grub.cfg`

Prepare network and gdm for restart:

`sudo systemctl enable NetworkManager`

`sudo systemctl enable gdm`

Exit from chroot, unmount the partitions, close the device and reboot:

`exit`

`umount -R /mnt/boot`


`umount -R /mnt`

`cryptsetup close cryptroot`

`systemctl reboot`