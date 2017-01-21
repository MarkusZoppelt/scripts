#!/bin/sh

brew update && brew upgrade; brew doctor; brew cleanup; brew cask cleanup
