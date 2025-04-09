# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# confirm bigiq1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.51 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
