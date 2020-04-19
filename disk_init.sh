ENV_FILE="/tmp/host-env.log"

df -h | grep /mnt/disk | while read v_df
do
    v_disk=$(echo ${v_df} | awk '{print $1}')
    v_dir=$(echo ${v_df} | awk '{print $6}')

    umount ${v_disk} >> ${ENV_FILE} 2>&1

    tune2fs -o journal_data_writeback ${v_disk} >> ${ENV_FILE} 2>&1
    tune2fs -O ^has_journal ${v_disk} >> ${ENV_FILE} 2>&1

    mount -o noatime ${v_disk} ${v_dir} >> ${ENV_FILE} 2>&1
done
