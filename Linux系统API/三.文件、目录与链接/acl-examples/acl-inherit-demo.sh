#!/usr/bin/env bash
(
set -eu
target_uid=$(id -u nobody)  # 如果需要，换成已有的其他普通用户。
lab=$(mktemp -d /tmp/acl-inherit.XXXXXX)
printf '继承实验目录：%s\n' "$lab"
setfacl -k "$lab"
setfacl -b "$lab"
chmod 700 "$lab"
mkdir "$lab/shared"
chmod 700 "$lab/shared"
printf 'old\n' > "$lab/shared/before.txt"
chmod 600 "$lab/shared/before.txt"

# 当前目录的访问规则，与未来子项的默认规则分别设置。
setfacl -m "u:${target_uid}:r-x,m::r-x" "$lab/shared"
setfacl -d -m "u::rwx,u:${target_uid}:rwx,g::---,m::rwx,o::---" "$lab/shared"

# Bash 重定向新建普通文件通常请求 0666；mkdir 默认请求 0777。
# 故意用严格 umask，观察默认 ACL 路径与普通 umask 路径的区别。
(umask 077; printf 'new\n' > "$lab/shared/after.txt"; mkdir "$lab/shared/sub")
getfacl -n "$lab/shared/before.txt" "$lab/shared/after.txt" "$lab/shared/sub"

rm -- "$lab/shared/before.txt" "$lab/shared/after.txt"
rmdir -- "$lab/shared/sub" "$lab/shared" "$lab"
)
