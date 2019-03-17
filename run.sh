#!/bin/bash

openstack image list
if [[ $? -ne 0 ]] ; then
        echo "Failed to list OpenStack images. Please verify OpenStack configuration."
        exit 1
fi

wget -q https://cloud-images.ubuntu.com/releases/18.04/release/ubuntu-18.04-server-cloudimg-amd64.ova \
        https://cloud-images.ubuntu.com/releases/18.04/release/SHA1SUMS
if [[ $? -ne 0 ]] ; then
        echo "Failed to download files. Please verify connectivity."
        exit 1
fi

sha1sum --check --ignore-missing SHA1SUMS
if [[ $? -ne 0 ]] ; then
        echo "Checksum did not match. Please verity connectivity."
        exit 1
fi

openstack image create ubuntu-18.04-server-cloudimg-amd64 \
        --disk-format vmdk --container-format bare --file ./ubuntu-18.04-server-cloudimg-amd64.ova --public \
        --min-disk 10 --min-ram 512 \
        --property vmware_adaptertype="lsiLogic" \
        --property vmware_disktype="streamOptimized" \
        --property vmware_ostype="ubuntu64Guest"
