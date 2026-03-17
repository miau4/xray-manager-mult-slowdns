#!/bin/bash
clear
echo "Instalando SlowDNS (versão corrigida)..."

mkdir -p /etc/slowdns
cd /etc/slowdns || exit

# Baixar scripts
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/slowdns-ssh
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/slowdns-ssl
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/slowdns-drop
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/slowdns-socks
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/slowdns-info
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/startdns
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/restartdns
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/stopdns
wget -q -N https://raw.githubusercontent.com/miau4/xray-manager-mult-slowdns/main/remove-slow

chmod +x /etc/slowdns/*

# ----------------- CRIAR MENU REAL -----------------
cat > /usr/local/bin/slowdns << 'EOF'
#!/bin/bash

while true; do
clear
echo "══════ SLOWDNS MANAGER ══════"
echo "1) Iniciar SlowDNS"
echo "2) Parar SlowDNS"
echo "3) Reiniciar SlowDNS"
echo "4) Status"
echo "5) Modo SSH"
echo "6) Modo SSL"
echo "7) Modo SOCKS"
echo "8) Dropbear"
echo "9) Remover SlowDNS"
echo "0) Voltar"
echo "═════════════════════════════"

read -p "Escolha: " op

case $op in
    1) /etc/slowdns/startdns ;;
    2) /etc/slowdns/stopdns ;;
    3) /etc/slowdns/restartdns ;;
    4) /etc/slowdns/slowdns-info ; read -p "Enter..." ;;
    5) /etc/slowdns/slowdns-ssh ;;
    6) /etc/slowdns/slowdns-ssl ;;
    7) /etc/slowdns/slowdns-socks ;;
    8) /etc/slowdns/slowdns-drop ;;
    9) /etc/slowdns/remove-slow ; break ;;
    0) break ;;
    *) echo "Inválido"; sleep 1 ;;
esac

done
EOF

chmod +x /usr/local/bin/slowdns

echo "✅ SlowDNS instalado com menu funcional!"
