#!/bin/ash
# vim: set ft=sh

set -e

# copy the entire packer project to the task output
cp -a concourse-packer/. prepare-release/

# copy the concourse binary to the task output
cp concourse-release/concourse_linux_amd64 prepare-release/cookbooks/concourse/files/.

# get version from the source download (the only reason we downloaded it)
VERSION=$(basename concourse-*.tar.gz .tar.gz | awk -F"-" '{ print $2 }')

# append the version to the base config
if [ ! -z "$CONFIG" ]; then
  CONTENT="$CONFIG, \"concourse_version\": \"$VERSION\" "
fi

cat <<EOF > prepare-secrets/secrets.json
{ $CONFIG }
EOF
