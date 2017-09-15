#!/bin/bash
# Expect one arg, which is the path to the xe.rpm.zip file
XE_RPM_ZIP=$1

# Move into /tmp to run the installation
mkdir -p /tmp/install
cp ${XE_RPM_ZIP} /tmp/install/
cd /tmp/install

XE_RPM_BASE_ZIP="$(basename "${XE_RPM_ZIP}")"
XE_RPM="$(basename "${XE_RPM_BASE_ZIP}" .zip)"

unzip -j ${XE_RPM_BASE_ZIP} "Disk1/${XE_RPM}"
rpm --install --nodeps --nopre "${XE_RPM}"

