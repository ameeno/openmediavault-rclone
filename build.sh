#! /usr/bin/env bash

nerdctl run --rm --tty --interactive \
  --volume "$(pwd)"/source:/source \
  --volume "$(pwd)"/output:/output:rw \
  ubuntu:bionic \
  /bin/bash -c 'cp -r /source openmediavault-rclone && cd openmediavault-rclone && apt-get update && apt-get install -y dpkg-dev debhelper &&  find . -name ".DS_Store" -exec rm {} \; &&  dpkg-buildpackage -us -uc &&  cp -r ../openmediavault-rclone_* /output'
