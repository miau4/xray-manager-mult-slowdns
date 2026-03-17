#!/bin/bash
clear
echo "Iniciando instalação do SlowDNS via Xray Manager Mult SlowDNS..."

# Criar pasta de instalação
mkdir -p /etc/slowdns
cd /etc/slowdns || exit

# Baixar todos os scripts do repositório
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/slowdns
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/slowdns-ssh
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/slowdns-ssl
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/slowdns-drop
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/slowdns-socks
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/slowdns-info
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/startdns
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/restartdns
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/stopdns
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/remove-slow
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/server.key
wget -N https://raw.githubusercontent.com/SeuUsuario/xray-manager-mult-slowdns/main/server.pub

# Permissões
chmod +x /etc/slowdns/*
cp /etc/slowdns/slowdns /usr/local/bin/slowdns
chmod +x /usr/local/bin/slowdns

echo "Instalação concluída!"
echo "Use o comando 'slowdns' para abrir o menu SlowDNS."
