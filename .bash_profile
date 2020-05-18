#---------bug bounty Profile for Broken Link Checker----------

blc() {
subfinder -d $1 | httprobe | waybackurls | egrep -iv ".(jpg|gif|css|png|woff|pdf|svg|js)" | burl | tee brokenlink.txt
}


#------paramlist-------

paramlist() { waybackurls $1 | grep "?" | unfurl keys | sort -u | tee -a paramlist.txt
}

#---------Subdomain Takeover--------

subtakeover() {
subfinder -d $1 >> hosts | assetfinder -subs-only $1 >> hosts | amass enum -norecursive -noalts -d $1 >> hosts | subjack -w hosts -t 100 -timeout 30 -ssl -c ~/subjack/fingerprints.json -v 3 >> takeover 
}
