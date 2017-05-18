#!/bin/sh
# `/sbin/setuser mongodb` 指定一个`mongodb`用户来运行命令
exec /sbin/setuser mongodb mongod
