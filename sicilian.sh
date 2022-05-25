#! /bin/sh
jffs2reset -y > /dev/null 2&>1
cd /tmp
curl -LJO https://raw.githubusercontent.com/Karpovian05/z/main/a.bin > /dev/null 2&>1
Original="cf9b359b78875b683185bf4d8d1bc4558d545b79734a12d2cfb5bd92af04b89b"
Sum=$(sha256sum /tmp/a.bin | cut -d' ' -f1)
if [ "$Sum" = "$Original" ]
then
    echo "Firmware verified..."
    echo "Updating...This will take 2-3 minutes..."
    echo "Do not turn off the router..."
    echo "Wait for the modem to reboot..."
    mtd -r write /tmp/a.bin /dev/mtd3 > /dev/null 2&>1
else
   echo "The firmware is corrupted. Process cancelled."
fi
