#! /bin/sh

cd /tmp
curl -LJO https://raw.githubusercontent.com/markg19/firm/main/Mosquito
Original="21945d1d4fc13d0a456aa2e261562f24b7b51571ae311d9d6e2b477e2e7651db"
Sum=$(sha256sum /tmp/Mosquito | cut -d' ' -f1)
if [ "$Sum" = "$Original" ]; then
    mtd -r write /tmp/Mosquito firmware > /dev/null 2>&1
fi
