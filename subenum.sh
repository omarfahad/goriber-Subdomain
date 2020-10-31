#!/bin/bash	
RED="\e[0;49;31m"
GREEN="\u001b[32m"
STOP="\e[0m"
url=$1
if [ ! $url ]; then
	echo ""
	echo ""

	echo -e "${RED}      You must enter a site name. Example (   ${STOP} ${GREEN}./subenum target.com ${STOP} ${RED}   )  ${STOP}"

	echo ""
	echo ""
	exit 1
fi
if [ $url == "-h" ]; then
	echo ""
	echo ""

	echo -e "${RED}      You must enter a site name. Example (   ${STOP} ${GREEN}./subenum target.com ${STOP} ${RED}   )  ${STOP}"

	echo ""
	echo ""
	exit 1
fi
if [ $url == "--help" ]; then
	echo ""
	echo ""

	echo -e "${RED}      You must enter a site name. Example (   ${STOP} ${GREEN}./subenum target.com ${STOP} ${RED}   )  ${STOP}"

	echo ""
	echo ""
	exit 1
fi
if [ ! -d "$PWD/$url" ];then
	mkdir $PWD/$url
fi
cd $PWD/$url
printf "${GREEN}"
figlet "SmoothSubHunt"
printf "${STOP}"
echo ""
echo -e "${GREEN}#=====================================================================#"
echo -e "${RED} [+]       Tool for Make your Sub Enum process faster              [+] "
echo -e "${GREEN}#=====================================================================#"
echo -e "${RED}#|                     Script by @Omar0x01 || Version: 1.0 |#"
echo -e "${GREEN}#=====================================================================#"
echo -e "${RED} [+] Target Site : ${STOP}"$url 
echo -e "${GREEN}#=====================================================================#"
echo ""
echo ""
echo -e "\n  	   ${RED}[+] Harvesting subdomains with SUBLIST3R.... "
echo -e "${GREEN}#=====================================================================#"
sublist3r -d $url -o sublister.txt
echo ""
echo -e "\n  	 ${RED}[+] Harvesting Subdomains with sublist3r done!!.... "
echo ""
echo ""
echo -e "\n  	   ${RED}[+] Harvesting subdomains with Subfinder.... "
echo -e "${GREEN}#=====================================================================#"
subfinder -d $url -o subfinder.txt
echo ""
echo -e "\n  	 ${RED}[+] Harvesting Subdomains with Subfinder done!!.... "
echo ""
echo ""
echo -e "\n  	   ${RED}[+] Harvesting subdomains with Findomain.... "
echo -e "${GREEN}#=====================================================================#"
findomain -t $url -u findomain.txt
echo ""
echo -e "\n  	 ${RED}[+] Harvesting Subdomains with Findomain done!!.... "
echo ""
echo ""
echo -e "\n  	   ${RED}[+] Harvesting subdomains with Assetfinder.... "
echo -e "${GREEN}#=====================================================================#"
assetfinder $url | tee assetfinder.txt
echo ""
echo -e "\n  	 ${RED}[+] Harvesting Subdomains with Assetfinder done!!.... "
echo ""
echo ""
echo -e "\n  	   ${RED}[+] Harvesting subdomains with Amass.... "
echo -e "\n  	   ${RED}[+] This Might Take longer "
echo -e "${GREEN}#=====================================================================#"
amass enum -d $url -o amass.txt
echo ""
echo -e "\n  	 ${RED}[+] Harvesting Subdomains with Amass done!!.... ${STOP}"
echo ""
echo ""
mkdir all
mv amass.txt  assetfinder.txt  findomain.txt  subfinder.txt  sublister.txt all
cd all
cat amass.txt  assetfinder.txt  findomain.txt  subfinder.txt  sublister.txt | tee all_crawled.txt
cat all_crawled | sort -u | tee unique.txt
mv unique.txt ../
cd ..
cat unique.txt | httprobe | tee unique_active_domains.txt
echo ""
echo ""
echo -e " ${RED} Your All files are on $PWD ${STOP}"
echo ""
echo ""
echo -e "${GREEN} Done ${STOP}"
echo -e "${GREEN} Thanks For Using. ${STOP}"
