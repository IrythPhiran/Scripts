
#!/bin/bash

echo "
 ██████╗██╗   ██╗███████╗███████╗ ██████╗    ██████╗  ██████╗ ██████╗  ██████╗ █████╗ ███████╗████████╗     ██████╗ ██████╗  █████╗ ██████╗ ██████╗ ███████╗██████╗
██╔════╝╚██╗ ██╔╝██╔════╝██╔════╝██╔════╝    ██╔══██╗██╔═══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
██║      ╚████╔╝ ███████╗█████╗  ██║         ██████╔╝██║   ██║██║  ██║██║     ███████║███████╗   ██║       ██║  ███╗██████╔╝███████║██████╔╝██████╔╝█████╗  ██████╔╝
██║       ╚██╔╝  ╚════██║██╔══╝  ██║         ██╔═══╝ ██║   ██║██║  ██║██║     ██╔══██║╚════██║   ██║       ██║   ██║██╔══██╗██╔══██║██╔══██╗██╔══██╗██╔══╝  ██╔══██╗
╚██████╗   ██║   ███████║███████╗╚██████╗    ██║     ╚██████╔╝██████╔╝╚██████╗██║  ██║███████║   ██║       ╚██████╔╝██║  ██║██║  ██║██████╔╝██████╔╝███████╗██║  ██║
 ╚═════╝   ╚═╝   ╚══════╝╚══════╝ ╚═════╝    ╚═╝      ╚═════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝        ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝

"
echo "Quick setup and sanity check before starting............................................."
if [ -f $HOME/Documents/Podcasts ]
then
    :
else
    mkdir $HOME/Documents/Podcasts
fi

if [ -f $HOME/Documents/Podcasts/DarknetDiaries ]
then
    :
else
    mkdir $HOME/Documents/Podcasts/DarknetDiaries
fi

if [ -f $HOME/Documents/Podcasts/SmashingSecurity ]
then
    :
else
    mkdir $HOME/Documents/Podcasts/SmashingSecurity
fi

if [ -f $HOME/Documents/Podcasts/DownTheCyberSecurityRabbitHole ]
then
    :
else
    mkdir $HOME/Documents/Podcasts/DownTheCyberSecurityRabbitHole
fi

if [ -f $HOME/Documents/Podcasts/Tripwire ]
then
    :
else
    mkdir $HOME/Documents/Podcasts/Tripwire
fi

if [ -f $HOME/Documents/Podcasts/MaliciousLife ]
then
    :
else
    mkdir $HOME/Documents/Podcasts/MaliciousLife
fi
echo "Setup complete, all required directories created........................................."
#Darnet Diaries#################################################################################
echo "Changing directories....................................................................."
cd $HOME//Documents/Podcasts/DarknetDiaries/
if [ -f $HOME//Documents/Podcasts/DarknetDiaries/darknet_diaries.tar.gz ]
then
    echo "Deleting previous backup of the Darknet Diaries podcast.............................."
    rm darknet_diaries.tar.gz
else
    echo "No previous backup of the Darknet Diaries podcast was found, ignoring."
fi
echo "Creating a backup of the previous get...................................................."
tar cf darknet_diaries.tar *.mp3
echo "Compressing the file....................................................................."
gzip darknet_diaries.tar
if [ -f $HOME//Documents/Podcasts/DarknetDiaries/darknet_diaries.tar.gz ]
then
    echo "The backup process has completed successfully."
    echo "Proceeding with the cleanup step....................................................."
    rm *.mp3
else
    echo "Something went wrong boss, you may want to take a look at this manually."
fi
echo "Starting download........................................................................"
wget -nv -i https://darknetdiaries.com/darknet-diaries-all-episode-links.txt
echo "Download complete...................."
#Smashing Security##############################################################################
echo "Changing directories....................................................................."
cd $HOME//Documents/Podcasts/SmashingSecurity/
if [ -f $HOME//Documents/Podcasts/SmashingSecurity/smashing_security.tar.gz ]
then
    echo "Deleting previous backup of the Smashing Security podcast............................"
    rm smashing_security.tar.gz
else
    echo "No previous backup of the Smashing Security podcast was found, ignoring."
fi
echo "Creating a backup of the previous get...................................................."
tar cf smashing_security.tar *.mp3
echo "Compressing the file....................................................................."
gzip smashing_securiy.tar
if [ -f $HOME//Documents/Podcasts/SmashingSecurity/smashing_security.tar.gz ]
then
    echo "The backup process has completed successfully."
    echo "Proceeding with the cleanup step....................................................."
    rm *.mp3
else
    echo "Something went wrong boss, you may want to take a look at this manually."
fi
echo "Scraping website........................................................................."
curl https://feeds.fireside.fm/smashingsecurity/rss > scrape.txt
echo "Transforming scraped text into usable URLs..............................................."
grep --only-matching '"https.*.mp3" ' scrape.txt > grepped.txt
sed -r -i 's/"//' grepped.txt
sed -r -i 's/"//' grepped.txt
echo "Starting Download........................................................................"
wget -nv -i grepped.txt
echo "Download complete........................................................................"
echo "Renaming files to a sequential number...................................................."
ls -1t|grep .mp3|cat -n|while read n f;do mv -n "$f" "0$n.mp3";done
rm *.txt
#DownTheCyberSecurityRabbitHole#################################################################
echo "Changing directories....................................................................."
cd $HOME//Documents/Podcasts/DownTheCyberSecurityRabbitHole/
if [ -f $HOME//Documents/Podcasts/DownTheCyberSecurityRabbitHole/downtcysecrh.tar.gz ]
then
    echo "Deleting previous backup of the DownTheCyberSecurityRabbitHole podcast..............."
    rm downtcysecrh.tar.gz
else
    echo "No previous backup of the DownTheCyberSecurityRabbitHole podcast was found, ignoring."
fi
echo "Creating a backup of the previous get...................................................."
tar cf downtcysecrh.tar *.mp3
echo "Compressing the file....................................................................."
gzip downtcysecrh.tar
if [ -f $HOME//Documents/Podcasts/DownTheCyberSecurityRabbitHole/downtcysecrh.tar.gz ]
then
    echo "The backup process has completed successfully."
    echo "Proceeding with the cleanup step....................................................."
    rm *.mp3
else
    echo "Something went wrong boss, you may want to take a look at this manually."
fi
echo "Scraping website........................................................................."
curl http://podcast.wh1t3rabbit.net/rss > scrape.txt
echo "Transforming scraped text into usable URLs..............................................."
grep "https://dts.podtrac.com/redirect.mp3/chrt.fm/track/144D87" scrape.txt > grepped.txt
sed -r -i 's/\?dest-id=76099" \/>//' grepped.txt
sed -r -i 's/^.*url="//' grepped.txt
echo "Starting Download........................................................................"
wget -nv -i grepped.txt
echo "Download complete........................................................................"
echo "Renaming files to a sequential number...................................................."
ls -1tr|grep .mp3|cat -n|while read n f;do mv -n "$f" "0$n.mp3";done
rm *.txt
#Tripwire#######################################################################################
echo "Changing directories....................................................................."
cd $HOME//Documents/Podcasts/Tripwire
if [ -f $HOME//Documents/Podcasts/Tripwire/tripwire.tar.gz ]
then
    echo "Deleting previous backup of the Tripwire podcast....................................."
    rm tripwire.tar.gz
else
    echo "No previous backup of the Tripwire podcast was found, ignoring."
fi
echo "Creating a backup of the previous get...................................................."
tar cf tripwire.tar *.mp3
echo "Compressing the file....................................................................."
gzip tripwire.tar
if [ -f $HOME//Documents/Podcasts/Tripwire/tripwire.tar.gz ]
then
    echo "The backup process has completed successfully."
    echo "Proceeding with the cleanup step....................................................."
    rm *.mp3
else
    echo "Something went wrong boss, you may want to take a look at this manually."
fi
echo "Scraping website........................................................................."
curl https://tripwire.libsyn.com/rss > scrape.txt
echo "Transforming scraped text into usable URLs..............................................."
grep "https://traffic.libsyn.com/secure/tripwire" scrape.txt > grepped.txt
sed -r -i 's/\?dest-id=.*" \/>//' grepped.txt
sed -r -i 's/^.*url="//' grepped.txt
echo "Starting Download........................................................................"
wget -nv -i grepped.txt
echo "Download complete........................................................................"
echo "Renaming files to a sequential number...................................................."
ls -1tr|grep .mp3|cat -n|while read n f;do mv -n "$f" "0$n.mp3";done
rm *.txt
#Malicious Life#################################################################################
echo "Changing directories....................................................................."
cd $HOME//Documents/Podcasts/MaliciousLife
if [ -f $HOME//Documents/Podcasts/MaliciousLife/malicious_life.tar.gz ]
then
    echo "Deleting previous backup of the Malicious Life podcast..............................."
    rm malicious_life.tar.gz
else
    echo "No previous backup of the Malicious Life podcast was found, ignoring."
fi
echo "Creating a backup of the previous get...................................................."
tar cf malicious_life.tar *.mp3
echo "Compressing the file....................................................................."
gzip malicious_life.tar
if [ -f $HOME//Documents/Podcasts/MaliciousLife/malicious_life.tar.gz ]
then
    echo "The backup process has completed successfully."
    echo "Proceeding with the cleanup step....................................................."
    rm *.mp3
else
    echo "Something went wrong boss, you may want to take a look at this manually."
fi
echo "Scraping website........................................................................."
curl https://malicious.life/feed/podcast/ > scrape.txt
echo "Transforming scraped text into usable URLs..............................................."
grep "https://media.blubrry.com/security_all_in/stream.redcircle.com/episodes" scrape.txt > grepped.txt
sed -r -i 's/\" length=".*//' grepped.txt
sed -r -i 's/^.*url="//' grepped.txt
echo "Starting Download........................................................................"
wget -nv -i grepped.txt
echo "Download complete........................................................................"
echo "Renaming files to a sequential number...................................................."
ls -1tr|grep .mp3|cat -n|while read n f;do mv -n "$f" "0$n.mp3";done
rm *.txt
echo "
███████╗ ██████╗██████╗ ██╗██████╗ ████████╗     ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗       ███████╗███╗   ██╗     ██╗ ██████╗ ██╗   ██╗██╗
██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝       ██╔════╝████╗  ██║     ██║██╔═══██╗╚██╗ ██╔╝██║
███████╗██║     ██████╔╝██║██████╔╝   ██║       ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗         █████╗  ██╔██╗ ██║     ██║██║   ██║ ╚████╔╝ ██║
╚════██║██║     ██╔══██╗██║██╔═══╝    ██║       ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝         ██╔══╝  ██║╚██╗██║██   ██║██║   ██║  ╚██╔╝  ╚═╝
███████║╚██████╗██║  ██║██║██║        ██║       ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗▄█╗    ███████╗██║ ╚████║╚█████╔╝╚██████╔╝   ██║   ██╗
╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝    ╚══════╝╚═╝  ╚═══╝ ╚════╝  ╚═════╝    ╚═╝   ╚═╝

"
