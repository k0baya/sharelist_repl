repo="reruin/sharelist"

tag=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//')

download_url="https://github.com/$repo/releases/download/$tag/sharelist_linux_amd64.tar.gz"

wget "$download_url" -O sharelist.tar.gz

tar -zxvf "sharelist.tar.gz" --overwrite

rm "sharelist.tar.gz"
rm "README.md"

chmod +x sharelist

./sharelist
