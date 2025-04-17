# download config from GitHub and copy and load/merge to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE/main/avr.scf --output /tmp/avr.scf
sudo scp /tmp/avr.scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file avr.scf
