#!/bin/sh

# 设置 JAVA_HOME 为 JDK 11 的路径
export JAVA_HOME="/root/tsfse/jdk11/jdk-11.0.21"

# 将 JDK 11 的 bin 目录添加到 PATH 中
export PATH="$JAVA_HOME/bin:$PATH"

# 指定 JAR 文件的位置
JAR_FILE="/root/tsfse/hzh-gateway/hzhGateway.jar"

# 设置 logback 的 log.path 变量
LOG_PATH="/root/tsfse/hzh-gateway/logs"

# 检查是否提供了配置文件参数，如果未提供，则使用默认配置文件路径
if [ $# -eq 0 ]; then
  CONFIG_FILE="/root/tsfse/hzh-gateway/config/bootstrap.yml"
  LOGBACK_CONFIG="/root/tsfse/hzh-gateway/config/logback-spring.xml"
else
  CONFIG_FILE="$1"
  LOGBACK_CONFIG="$2"
fi

# 指定 JVM 参数
JVM_OPTS="-Dname=hzhGateway -Duser.timezone=Asia/Shanghai -Xms512M -Xmx512M -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintGCDetails -XX:NewRatio=1 -XX:SurvivorRatio=30 -XX:+UseParallelGC -XX:+UseParallelOldGC -Dspring.profiles.active=pro  -Dlog.path=$LOG_PATH"

# 启动应用程序，同时指定配置文件和 log.path 变量
java $JVM_OPTS -jar $JAR_FILE --spring.config.location=$CONFIG_FILE --logging.config=$LOGBACK_CONFIG

# 检查应用程序的退出状态码
if [ $? -eq 0 ]; then
  echo "hzhGateway 已成功启动..."
else
  echo "hzhGateway 启动失败..."
fi
