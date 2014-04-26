#!/bin/bash

Usage(){
  printf ". setup.sh [oracle|hadoop|proxy|android]\n"
  printf "  oracle   setup path for Oracle instant client\n"
  printf "  hadoop   setup path for Hadoop & Hive\n"
  printf "  proxy    proxy settings when you are in Oracle network\n"
  printf "  android  setup path for Android SDK\n"
  printf "  webdev   start and setup Web Development env\n"
}

if [ "$#" -lt "1" ]; then
  Usage;
  exit -1;
fi

if [ "$0" != '-bash' ]; then
echo ' ---> ' $0
  printf "Message: Use '.' for changing the settings for current shell\n"
  Usage;
  exit -1;
fi

case $1 in
  oracle)
    printf "Setting up properties for Oracle Instant client ... "
    export INSTANTCLIENT_HOME=~/Developer/instantclient
    export TNS_ADMIN=${INSTANTCLIENT_HOME}
    export DYLD_LIBRARY_PATH=${INSTANTCLIENT_HOME}:${DYLD_LIBRARY_PATH}
    export PATH=${INSTANTCLIENT_HOME}:${PATH}
    ;;
  hadoop)
    printf "Setting up properties for Hadoop ... "
    export HADOOP_HOME=~/Developer/H/hadoop
    export HIVE_HOME=~/Developer/H/hive
    alias hadoop=${HADOOP_HOME}/bin/hadoop
    alias hive="${HIVE_HOME}/bin/hive -hiveconf hive.metastore.warehouse.dir=${HIVE_HOME}/warehouse"
    ;;
  proxy)
    printf "Setting up properties for proxy ... "
    export http_proxy=http://www-proxy.us.oracle.com/
    export https_proxy=${http_proxy}
    export ftp_proxy=${http_proxy}
    ;;
  android)
    printf "Setting up properties for Android SDK ... "
    export PATH=${PATH}:~/Developer/adt-bundle-mac/sdk/platform-tools:~/Developer/adt-bundle-mac/sdk/tools
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
    ;;
  webdev)
    printf "Starting tomcat ...\n"
    ~/Developer/tomcat/bin/startup.sh
    printf "Starting mongodb ...\n"
    ~/Developer/mongodb/bin/mongod --dbpath ~/Developer/mongodb/db --rest 2>&1 > /dev/null &;;
  *)
   Usage;
esac
printf "done!!\n\n"
