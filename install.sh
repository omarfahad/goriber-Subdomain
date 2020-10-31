#!/bin/bash	
RED="\e[0;49;31m"
GREEN="\u001b[32m"
STOP="\e[0m"
echo ""
echo ""
echo -e "${RED}				 Working on Installation ${STOP}"
echo ""
echo ""
if [ ! -d "tools" ]; then
	mkdir tools
fi
cd tools
echo ""
echo -e " ${RED}Installing Python PIP2 and PIP3 ${STOP}"
echo ""
sudo apt install python3-pip
sudo apt install python2
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python2 get-pip.py
wget https://github.com/OWASP/Amass/releases/download/v3.10.5/amass_linux_amd64.zip
unzip amass_linux_amd64
cd amass_linux_amd64
if [ ! -d "/usr/local/bin/amass" ]; then
	mv amass /usr/local/bin/
fi
cd ..
echo $PWD
rm -fr *
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo pip install -r requirements.txt
python setup.py install
cd ..
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.4.5/subfinder_2.4.5_linux_amd64.tar.gz
tar -xzvf subfinder_2.4.5_linux_amd64.tar.gz
if [ ! -d "/usr/local/bin/subfinder" ]; then
	mv subfinder /usr/local/bin/
fi
rm -fr *
wget https://github.com/Findomain/Findomain/releases/download/2.1.4/findomain-linux
mv findomain-linux findomain
chmod +x findomain
if [ ! -d "/usr/local/bin/findomain" ]; then
	mv findomain /usr/local/bin/
fi
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.0/assetfinder-linux-amd64-0.1.0.tgz
tar -xvf assetfinder-linux-amd64-0.1.0.tgz
if [ ! -d "/usr/local/bin/assetfinder" ]; then
	mv assetfinder /usr/local/bin/
fi
cd ..
chmod +x subenum.sh
rm -fr tools
echo -e " ${RED} Installation Done !!!!!!"
