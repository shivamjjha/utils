echo 'devices' | bluetoothctl | grep '^Device ' | while read -r dev
do
    dev_mac=$(echo "$dev" | cut -d' ' -f2)
    dev_name=$(echo "$dev" | cut -d' ' -f3-)
    dev_battery=$(echo "info $dev_mac" | bluetoothctl | sed -n '/Battery Percentage:/ s/.*(\([0-9]*\).*/\1/p')
    echo "$dev_name: $dev_battery%"
done
