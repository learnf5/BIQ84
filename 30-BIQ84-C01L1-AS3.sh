    # download config from GitHub and copy and load/merge to bigip1
    curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/avr.scf --output /tmp/avr.scf
    sudo scp /tmp/avr.scf 192.168.1.31:/var/local/scf
    sudo ssh 192.168.1.31 tmsh load sys config merge file avr.scf

    # download AS3 template from GitHub and load into bigiQ1
    curl --silent https://raw.githubusercontent.com/f5devcentral/f5-big-iq/refs/heads/7.1.0/f5-appsvcs-templates-big-iq/default/json/AS3-F5-HTTP-lb-template-big-iq-default.json --output /tmp/AS3-F5-HTTP-lb-template-big-iq-default.json
    sudo scp /tmp/AS3-F5-HTTP-lb-template-big-iq-default.json 192.168.1.51:/var/tmp/AS3-F5-HTTP-lb-template-big-iq-default.json
    sudo ssh curl -s -H "Content-Type: application/json" http://localhost:8100/cm/global/appsvcs-templates -X POST --upload-file /var/tmp/AS3-F5-HTTP-lb-template-big-iq-default.json | jq .
