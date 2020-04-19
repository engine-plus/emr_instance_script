#！/usr/bin/env bash

# init script when the instance starting

ENV_FILE="/tmp/host-env.log"

# init disk script
truncate -s 0 /etc/rc.local

echo "#!/bin/bash" >> /etc/rc.local
echo "" >> /etc/rc.local
echo "touch /var/lock/subsys/local" >> /etc/rc.local
echo "echo never > /sys/kernel/mm/transparent_hugepage/defrag" >> /etc/rc.local
echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.local
echo "" >> /etc/rc.local

df -h | grep /mnt/disk | while read v_df
do
    v_disk=$(echo ${v_df} | awk '{print $1}')
    v_dir=$(echo ${v_df} | awk '{print $6}')

    echo "umount ${v_disk} >> ${ENV_FILE} 2>&1" >> /etc/rc.local
    echo "tune2fs -o journal_data_writeback ${v_disk} >> ${ENV_FILE} 2>&1" >> /etc/rc.local
    echo "tune2fs -O ^has_journal ${v_disk} >> ${ENV_FILE} 2>&1" >> /etc/rc.local
    echo "mount -o noatime ${v_disk} ${v_dir} >> ${ENV_FILE} 2>&1" >> /etc/rc.local
    echo "" >> /etc/rc.local
done
