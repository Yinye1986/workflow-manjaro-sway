#!/bin/bash

# 获取 wpctl status 的输出
output=$(wpctl status)

# 提取 Sinks 部分，并过滤出包含设备ID的行
sinks=$(echo "$output" | grep "Sinks:" -A 9999 | sed -n '/Sources:/q;p')
sinks=$(echo "$sinks" | sed '1d;$d')

device_ids=()
current_id=-1

# 遍历每一行，提取设备ID
while IFS= read -r line; do
  # 使用正则表达式匹配行中的数字（设备ID）
  if [[ "$line" =~ ([0-9]+) ]]; then
    device_id=${BASH_REMATCH[1]} # 提取匹配的数字（设备ID）
    device_ids+=($device_id) # 将设备ID添加到数组中
  fi
  if [[ "$line" =~ \*\ +([0-9]+) ]]; then
    device_id=${BASH_REMATCH[1]} # 提取匹配的数字（设备ID）
    current_id=($device_id)
  fi
done <<< "$sinks"

current_index=-1
for i in "${!device_ids[@]}"; do
  if [ "${device_ids[$i]}" == "$current_id" ]; then
    current_index=$i
    break
  fi
done
if [ "$current_index" -ne -1 ]; then
  next_index=$((current_index + 1))
  # 如果下一个索引在数组范围内
  if [ "$next_index" -lt "${#device_ids[@]}" ]; then
    # 设置下一个设备ID为默认
    wpctl set-default "${device_ids[$next_index]}"
  else
    # 如果没有下一个设备ID，则回到数组的第一个设备ID
    wpctl set-default "${device_ids[0]}"
  fi
else
  echo "Current sink ID not found in device IDs array."
fi
