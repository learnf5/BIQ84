# grab student files from GitHub 
labdir=/home/student/Desktop/Lab_Files
mkdir $labdir
curl --silent --remote-name-all --output-dir $labdir/ https://raw.githubusercontent.com/learnf5/$COURSE/main/cut_and_paste.txt
curl --silent --remote-name-all --output-dir $labdir/ https://raw.githubusercontent.com/learnf5/$COURSE/main/expired_certificate.crt
