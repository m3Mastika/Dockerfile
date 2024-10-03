#!/bin/bash
KULLANICI_ADI="aziz"
SIFRE="baba"
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
echo -e "PasswordAuthentication yes\nChallengeResponseAuthentication no\nPubkeyAuthentication no" | sudo tee /etc/ssh/sshd_config
sudo useradd -m $KULLANICI_ADI && echo "$KULLANICI_ADI:$SIFRE" | sudo chpasswd
sudo systemctl restart sshd
sudo firewall-cmd --permanent --add-port=22/tcp
sudo firewall-cmd --reload
echo "SSH yapılandırması güncellendi, kullanıcı '$KULLANICI_ADI' oluşturuldu ve servis yeniden başlatıldı."
