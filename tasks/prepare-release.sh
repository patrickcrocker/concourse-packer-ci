#!/bin/ash
# vim: set ft=sh

set -e

# copy the entire packer project to the task output
cp -R concourse-packer/ prepare-release/

# copy the concourse binary to the task output
cp concourse-release/concourse_linux_amd64 prepare-release/cookbooks/concourse/files/.
