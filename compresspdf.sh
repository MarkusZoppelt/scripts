#!/bin/sh

filename=$1
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=tmp_comp.pdf $filename &&\
mv tmp_comp.pdf $filename
