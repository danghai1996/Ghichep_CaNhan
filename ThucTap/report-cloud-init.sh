#!/bin/bash

# Report timeout Cloud-init

# ID chat Telegram
USERID="<ID chat>"

# API Token bot
TOKEN="<token_bot>"

TIMEOUT="20"

# URL gửi tin nhắn của bot
URL="https://api.telegram.org/bot$TOKEN/sendMessage"


# Thời gian hệ thống
DATE_EXEC="$(date "+%d %b %Y %H:%M")"

#-----------------------------#

# Lấy số lượng request timeout
RQ_TIMEOUT=$(cat /root/check-timeout-cloudinit/log-time-curl.txt | grep HTTP | grep -v 200 | wc -l) > /dev/null

# Lấy số lượng tổng request
RQ_TOTAL=$(cat /root/check-timeout-cloudinit/log-time-curl.txt | grep HTTP | wc -l) > /dev/null

# Liệt kê thời điểm timeout
LIST_TO=$(cat /root/check-timeout-cloudinit/log-time-curl.txt |grep HTTP| grep -v 200 | awk -F ' ' '{print $1 " " $2 "-" $5 " " $6 " " $7}')> /dev/null

#-----------------------------#

# TEXT=$(echo -e "[Báo cáo ngày]: $DATE_EXEC\nCụm FPT:\n- Tổng số request: $RQ_TIMEOUT\n- Số request Timeout: $RQ_TOTAL\n=====================\nThời điểm timeout\n\n$LIST_TO")

TEXT=$(echo -e "[Báo cáo ngày]: $DATE_EXEC\nCụm CMC:\n- Tổng số request: $RQ_TIMEOUT\n- Số request Timeout: $RQ_TOTAL\n=====================\nThời điểm timeout\n\n$LIST_TO")

# Gửi cảnh báo
curl -s -X "POST" $URL -d "text=<code>$TEXT</code>" -d "chat_id=$USERID" -d "parse_mode=html" > /dev/null

# Xóa file log
# rm -f /root/check-timeout-cloudinit/log-time-curl.txt