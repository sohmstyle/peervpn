#!/bin/bash

/usr/bin/debuild -us -uc && \
mv /mnt/*deb /mnt/repo/ && \
/usr/bin/dpkg-scanpackages /mnt/repo/ /dev/null | gzip -9c > /mnt/repo/Packages.gz
