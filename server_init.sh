printf '\nexport TCMALLOC_RELEASE_RATE=10\n' >> /etc/profile.d/kudu.sh

yum install jq -y
yum install iotop iftop sysstat perf -y
