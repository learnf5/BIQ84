# set jump to PST/PDT TZ
sudo timedatectl set-timezone America/Los_Angeles

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# confirm bigiq1 is active
###need to run ssh-copy-id on jump for this to work; commenting out for now; will fix later
###for i in {1..12}; do [ "$(sudo ssh root@192.168.1.51 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
