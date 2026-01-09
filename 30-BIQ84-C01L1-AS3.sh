# download AS3 template from GitHub and load into bigiq1
curl --silent https://raw.githubusercontent.com/f5devcentral/f5-big-iq/refs/heads/7.1.0/f5-appsvcs-templates-big-iq/default/json/AS3-F5-HTTP-lb-template-big-iq-default.json --output /tmp/AS3-F5-HTTP-lb-template-big-iq-default.json
ssh-keyscan -H 192.168.1.51 >> ~/.ssh/known_hosts
sshpass -p f5trn001 scp /tmp/AS3-F5-HTTP-lb-template-big-iq-default.json root@192.168.1.51:/var/tmp/AS3-F5-HTTP-lb-template-big-iq-default.jsoก
sshpass -p f5trn001 ssh root@192.168.1.51 curl -skH "Content-Type: application/json" http://localhost:8100/cm/global/appsvcs-templates -X POST -d @/var/tmp/AS3-F5-HTTP-lb-template-big-iq-default.json | jq .

# download config from GitHub and copy and load/merge to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/avr.scf --output /tmp/avr.scf
sudo scp /tmp/avr.scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file avr.scf
