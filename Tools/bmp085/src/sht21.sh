#!/bin/sh
RAWTEMP=$(i2cget -y 0 0x40 0xe3 w)
RAWHUMI=$(i2cget -y 0 0x40 0xe5 w)
if (echo "$RAWTEMP"| grep -Eq '0x[0-9a-f]{4}'); then
   HEXORDERED=$(echo "$RAWTEMP"|sed -r 's/0x([0-9a-f]{2})([0-9a-f]{2})/0x\2\1/')
   DECRAW=$(($HEXORDERED))
   echo $DECRAW | awk -v tem=${DECRAW} '{ printf "%.2f stC\n", -46.85+((tem*175.72)/65536)}'
fi
if (echo "$RAWHUMI"| grep -Eq '0x[0-9a-f]{4}'); then
   HEXORDERED=$(echo "$RAWHUMI"|sed -r 's/0x([0-9a-f]{2})([0-9a-f]{2})/0x\2\1/')
   DECRAW=$(($HEXORDERED))
   echo $DECRAW | awk -v hum=${DECRAW} '{ printf "%.2f %%RH\n", -6+((hum*125)/65536)}'
fi