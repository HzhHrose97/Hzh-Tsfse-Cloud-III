#!/bin/sh

# 停止应用程序
PID=$(ps -ef | grep java | grep hzhcenter | grep -v grep | awk '{print $2}')
if [ "$PID" != "" ]; then
    kill -TERM $PID
    echo "hzhcenter 正在退出..."
    while [ "$PID" != "" ]; do
        sleep 1
        PID=$(ps -ef | grep java | grep hzhcenter | grep -v grep | awk '{print $2}')
    done
    echo "hzhcenter 已停止."
else
    echo "hzhcenter 已停止."
fi