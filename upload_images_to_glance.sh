#! /bin/bash

# Remember to export your OpenStack credentials
# Customize these
export OS_USERNAME=...
export OS_PASSWORD=...
export OS_AUTH_URL=***REMOVED***.0
export OS_PROJECT_ID=9c2adc08a22d46b0a0291cd82b2519d7
IMAGE_PREFIX="sumaform-"
WORKDIR="/tmp"
# Stop there!

cd $WORKDIR
wget -c http://download.suse.de/ibs/home:/SilvioMoioli:/terraform:/sles11sp3/images/sles11sp3.x86_64-3.2.0-Build2.2.qcow2
wget -c http://download.suse.de/ibs/home:/SilvioMoioli:/terraform:/sles11sp4/images/sles11sp4.x86_64-3.2.0-Build2.1.qcow2
wget -c http://download.suse.de/ibs/home:/SilvioMoioli:/terraform:/sles12/images/sles12.x86_64.qcow2
wget -c http://download.suse.de/ibs/home:/SilvioMoioli:/terraform:/sles12sp1/images/sles12sp1.x86_64.qcow2

for i in *.qcow2; do glance --insecure image-create --name $IMAGE_PREFIX${i%%.*} --disk-format=qcow2 --container-format=bare --file $i; done