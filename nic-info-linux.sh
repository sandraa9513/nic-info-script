#!/bin/bash
# nic-info-linux.sh - Išsami tinklo informacija

echo "Host: $(hostname)"
echo "Date: $(date)"
echo "Kernel: $(uname -r)"
echo "----------------------------------------"

echo "Tinklo adapteriai ir būsenos:"
ip -o link show | while read -r idx rest; do
  ifname=$(echo "$rest" | awk -F: '{print $2}' | xargs)
  state=$(ip -o link show "$ifname" | awk '{for(i=1;i<=NF;i++){ if($i ~ /state/) {print $(i+1)} }}')
  mac=$(cat /sys/class/net/"$ifname"/address 2>/dev/null || echo "(n/a)")
  echo "- $ifname  state: ${state:-UNKNOWN}  MAC: $mac"
done

echo "----------------------------------------"
echo "IPv4 adresai:"
ip -4 -o addr show | awk '{print $2" : "$4}'

echo "----------------------------------------"
echo "IPv6 adresai:"
ip -6 -o addr show | awk '{print $2" : "$4}'

echo "----------------------------------------"
echo "Numatytieji vartai (default gateway):"
ip route show default || echo "(nėra default gateway)"

echo "----------------------------------------"
echo "Pilna maršruto lentelė (IPv4):"
ip route

echo "----------------------------------------"
echo "DNS serveriai (/etc/resolv.conf):"
if [ -r /etc/resolv.conf ]; then
  grep -E '^nameserver' /etc/resolv.conf || echo "(nėra)"
else
  echo "(resolv.conf nėra pasiekiamas)"
fi

echo "----------------------------------------"
echo "NetworkManager status (jei yra):"
if command -v nmcli >/dev/null 2>&1; then
  nmcli general status
else
  echo "(nmcli nepasileidžia)"
fi

echo "----------------------------------------"
