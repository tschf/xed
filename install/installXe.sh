#!/bin/bash
# Expect one arg, which is the path to the xe.rpm.zip file
XE_RPM_ZIP=$1
XE_CONF_INPUT=$HOME/install/xe-conf-input.txt
LISTENER_FILE=$HOME/install/listener.ora
RUN_FILE=$HOME/install/runXe.sh

# Move into /tmp to run the installation
mkdir -p /tmp/install
cp ${XE_RPM_ZIP} ${XE_CONF_INPUT} ${LISTENER_FILE} ${RUN_FILE} /tmp/install/
cd /tmp/install

XE_RPM_BASE_ZIP="$(basename "${XE_RPM_ZIP}")"
XE_RPM="$(basename "${XE_RPM_BASE_ZIP}" .zip)"

unzip -j ${XE_RPM_BASE_ZIP} "Disk1/${XE_RPM}"
rpm --install --nodeps --nopre "${XE_RPM}"

# https://www.stigviewer.com/stig/oracle_database_11g_instance/2015-03-26/finding/V-2531
# Set to something other than default of OP$
echo 'OS_AUTHENT_PREFIX=""' | tee -a "$ORACLE_HOME/config/scripts/init.ora" > /dev/null
cp listener.ora $ORACLE_HOME/network/admin/listener.ora
cp runXe.sh $ORACLE_BASE/runXe.sh

/etc/init.d/oracle-xe configure < xe-conf-input.txt

sqlplus sys/oracle as sysdba <<SQL
create user scott identified by tiger;
grant connect,resource to scott;
SQL
