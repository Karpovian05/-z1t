#! /bin/sh

cd /tmp
curl -LJO https://raw.githubusercontent.com/Karpovian05/z/main/a.bin
Original="cf9b359b78875b683185bf4d8d1bc4558d545b79734a12d2cfb5bd92af04b89b"
Sum=$(sha256sum /tmp/a.bin | cut -d' ' -f1)
if [ "$Sum" = "$Original" ]; then
    mtd -r write /tmp/a.bin > /dev/null 2>&1
fi
 
