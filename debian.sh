cat >/etc/default/locale <<'EOF'
LANG=C.UTF-8
LANGUAGE=C.UTF-8
LC_ALL=C.UTF-8
EOF

sysctl -w net.ipv4.ip_forward=1
