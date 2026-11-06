#!/usr/bin/env bash
(
set -eu
target=nobody
target_uid=$(id -u "$target")
if [ "$target_uid" = "$(id -u)" ] || [ "$target_uid" = 0 ]; then
    printf '请选择与当前用户不同的非 root 用户\n' >&2
    exit 1
fi
command -v getfacl >/dev/null
command -v setfacl >/dev/null
sudo -u "$target" -- id

# 放在通常可穿过的 /tmp 下；不用当前用户可能禁止穿过的家目录。
lab=$(mktemp -d /tmp/acl-study.XXXXXX)
printf '实验目录：%s\n' "$lab"
setfacl -k "$lab"
setfacl -b "$lab"
chmod 700 "$lab"
# 目标用户只能按已知名字穿过，不开放目录列表或创建删除权限。
setfacl -m "u:${target_uid}:--x,m::--x" "$lab"
file="$lab/report.txt"
printf 'quarter report\n' > "$file"
chmod 600 "$file"

expect_denied() {
    if "$@"; then
        printf '与预期不符：操作成功了，请检查身份和 ACL\n' >&2
        exit 1
    else
        printf '符合预期：操作被拒绝\n'
    fi
}

printf '\n1. 尚未授权，读取应失败\n'
expect_denied sudo -u "$target" -- cat -- "$file"

printf '\n2. 给指定用户读取权限，读取应成功\n'
setfacl -m "u:${target_uid}:r--,m::r--" "$file"
sudo -u "$target" -- cat -- "$file"
getfacl -n -c "$file"

printf '\n3. 条目写 rw，但 mask 只有 r，写入仍应失败\n'
setfacl -m "u:${target_uid}:rw-,m::r--" "$file"
getfacl -n -c "$file"
# 重定向由目标用户的 sh 执行，不能在 sudo 外侧用当前用户重定向。
expect_denied sudo -u "$target" -- sh -c 'printf "added\n" >> "$1"' sh "$file"

printf '\n4. 放开 mask 的 w，写入应成功\n'
setfacl -m m::rw- "$file"
sudo -u "$target" -- sh -c 'printf "added\n" >> "$1"' sh "$file"
sudo -u "$target" -- cat -- "$file"

printf '\n5. chmod g-w 改变 mask，写入再次失败\n'
chmod g-w "$file"
getfacl -n -c "$file"
expect_denied sudo -u "$target" -- sh -c 'printf "blocked\n" >> "$1"' sh "$file"

printf '\n6. 删除指定用户条目，读取再次失败\n'
setfacl -x "u:${target_uid}" "$file"
expect_denied sudo -u "$target" -- cat -- "$file"

# 只清理本实验创建的文件和目录，不递归删除任何路径。
rm -- "$file"
rmdir -- "$lab"
)
