#!/bin/bash

# Yeni kullanıcı bilgileri
KULLANICI_ADI="aziz"
SIFRE="baba"

# SSH yapılandırma dosyasının yedeğini al
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# SSH yapılandırma dosyasını düzenle
echo -e "PasswordAuthentication yes\nChallengeResponseAuthentication no\nPubkeyAuthentication no" | sudo tee /etc/ssh/sshd_config

# Yeni kullanıcı oluştur
sudo useradd -m $KULLANICI_ADI && echo "$KULLANICI_ADI:$SIFRE" | sudo chpasswd

# SSH servisini yeniden başlat
sudo systemctl restart sshd

# Firewall ayarlarını kontrol et ve SSH trafiğine izin ver
sudo firewall-cmd --permanent --add-port=22/tcp
sudo firewall-cmd --reload

echo "SSH yapılandırması güncellendi, kullanıcı '$KULLANICI_ADI' oluşturuldu ve servis yeniden başlatıldı."
