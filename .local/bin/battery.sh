#! /usr/bin/env sh

source /sys/class/power_supply/BAT1/uevent > /dev/null
LEVEL=`bc <<< "scale=1; $POWER_SUPPLY_CHARGE_NOW * 100 / $POWER_SUPPLY_CHARGE_FULL"`
ICON=`echo $LEVEL 20 40 60 80 | awk '{if ($1 < $2) print ""; else if ($1 < $3) print ""; else if ($1 < $4) print ""; else if ($1 < $5) print ""; else print ""}'`
echo -n $ICON $POWER_SUPPLY_STATUS $LEVEL%
