#!/bin/bash

# 该脚本用于在33001端口上一键运行ShareList，并将当前目录直接挂载到sharelist中

wget https://github.com/reruin/sharelist/releases/download/v0.3.15/sharelist_linux_amd64.tar.gz

tar -xzvf sharelist_linux_amd64.tar.gz

rm sharelist_linux_amd64.tar.gz

chmod +x sharelist 

mkdir -p ./cache

config='{"token":"sharelist","proxy_enable":false,"index_enable":true,"expand_single_disk":true,"max_age_dir":900000,"max_age_file":300000,"theme":"default","ignores":[],"acl_file":".passwd","max_age_download_sign":"sl_1706577099337","anonymous_upload_enable":false,"anonymous_download_enable":true,"webdav_path":"","proxy_paths":[],"proxy_server":"","webdav_proxy":true,"webdav_user":"admin","webdav_pass":"sharelist","ocr_server":"","drives":[{"name":"tar","path":"file:///workspaces/workspace"}],"proxy_url":"https://reruin.github.io/sharelist/redirect.html"}'

config=$(echo $config | sed "s|file:///workspaces/workspace|file://${PWD}|g")

echo $config > ./cache/config.json

./sharelist
