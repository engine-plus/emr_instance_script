ENV_FILE="/tmp/host-env.log"

# env print

echo "env message : " >> ${ENV_FILE}
env >> ${ENV_FILE}
echo "====================" >> ${ENV_FILE}

echo "disk message : " >> ${ENV_FILE}
fdisk -l >> ${ENV_FILE}
echo "====================" >> ${ENV_FILE}

echo "df message : " >> ${ENV_FILE}
df -h >> ${ENV_FILE}
echo "====================" >> ${ENV_FILE}

echo "mount message : " >> ${ENV_FILE}
cat /etc/fstab >> ${ENV_FILE}
echo "====================" >> ${ENV_FILE}

echo "java process : " >> ${ENV_FILE}
jps -mlv >> ${ENV_FILE}
echo "====================" >> ${ENV_FILE}

echo "all process : " >> ${ENV_FILE}
ps -aux >> ${ENV_FILE}
echo "====================" >> ${ENV_FILE}
