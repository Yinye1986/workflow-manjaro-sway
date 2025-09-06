#!/bin/bash

URL="https://github-hosts.tinsfox.com/hosts"
TEMP="/tmp/github_hosts.tmp"
curl -o "$TEMP" "$URL"
if [ $? -ne 0 ]; then
    exit 1
fi
sudo sed -i '/# GitHub Host Start/,/# GitHub Host End/d' /etc/hosts
{
    echo "# GitHub Host Start"
    cat "$TEMP"
    echo "# GitHub Host End"
} | sudo tee -a /etc/hosts > /dev/null
rm -f "$TEMP"
