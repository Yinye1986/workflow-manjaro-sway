#!/bin/bash

username="1312332228"
password="xiao1102"
ip=$(ip -4 addr show wlp6s0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
curl --noproxy -X POST -H "Content-Type: application/json" -d "{\"username\":\"$username\",\"password\":\"$password\",\"ifautologin\":\"1\",\"channel\":\"_GET\",\"pagesign\":\"firstauth\",\"usripadd\":\"$ip\"}" http://net.wxit.edu.cn/api/v1/login
curl --noproxy -X POST -H "Content-Type: application/json" -d "{\"username\":\"$username\",\"password\":\"$password\",\"ifautologin\":\"1\",\"channel\":\"4\",\"pagesign\":\"secondauth\",\"usripadd\":\"$ip\"}" http://net.wxit.edu.cn/api/v1/login    

# curl 'http://net.wxit.edu.cn/api/v1/login' \
#   -X POST \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0' \
#   -H 'Accept: application/json, text/plain, */*' \
#   -H 'Accept-Language: zh-CN,en-US;q=0.5' \
#   -H 'Accept-Encoding: gzip, deflate' \
#   -H 'Content-Type: application/json;charset=UTF-8' \
#   -H 'Access-Control-Allow-Origin: *' \
#   -H 'Origin: http://net.wxit.edu.cn' \
#   -H 'Connection: keep-alive' \
#   -H 'Referer: http://net.wxit.edu.cn/' \
#   -H 'Priority: u=0' \
#   --data-raw '{"username":"1312332228","password":"xiao1102","ifautologin":"1","channel":"_GET","pagesign":"firstauth","usripadd":"10.51.170.83"}'
# curl 'http://net.wxit.edu.cn/api/v1/login' \
#   -X POST \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0' \
#   -H 'Accept: application/json, text/plain, */*' \
#   -H 'Accept-Language: zh-CN,en-US;q=0.5' \
#   -H 'Accept-Encoding: gzip, deflate' \
#   -H 'Content-Type: application/json;charset=UTF-8' \
#   -H 'Access-Control-Allow-Origin: *' \
#   -H 'Origin: http://net.wxit.edu.cn' \
#   -H 'Connection: keep-alive' \
#   -H 'Referer: http://net.wxit.edu.cn/' \
#   -H 'Priority: u=0' \
#   --data-raw '{"username":"1312332228","password":"xiao1102","ifautologin":"1","channel":"4","pagesign":"secondauth","usripadd":"10.51.170.83"}'
