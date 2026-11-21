#!/bin/bash
set -e

# Setup group and users
sudo groupadd developers 2>/dev/null || true
sudo id -u alice &>/dev/null || sudo useradd -m -s /bin/bash -g developers alice
sudo id -u bob &>/dev/null || sudo useradd -m -s /bin/bash bob

# Setup directory and permissions
sudo mkdir -p /opt/secure_data
echo "Confidential Data: Developers Only" | sudo tee /opt/secure_data/confidential.txt > /dev/null
sudo chown -R root:developers /opt/secure_data
sudo chmod 770 /opt/secure_data
sudo chmod 660 /opt/secure_data/confidential.txt

# Verification
ls -ld /opt/secure_data
id alice
id bob
sudo -u alice cat /opt/secure_data/confidential.txt
sudo -u alice touch /opt/secure_data/alice_work.txt
sudo -u bob cat /opt/secure_data/confidential.txt || echo "Expected: Permission denied"
sudo -u bob ls -la /opt/secure_data || echo "Expected: Permission denied"
