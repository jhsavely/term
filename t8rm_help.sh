#GETHER hardware info
lscpu
inxi #quick view of the system information
inxi -G #list grephics drivers 
lscpu | grep -i mhz
lscpu | grep Endian #Little or Big Endian on CPU
cat /proc/cpuinfo
cat /proc/cpuinfo | grep -i mhz | uniq
watch cat /proc/cpuinfo | grep -i mhz | uniq
cat /proc/cpuinfo | grep 'processor'
sudo lshw -C network
lshw -class network
hwinfo --short
hwinfo --block --short
lspci
lsscsi
lsb_release -a #info abut distro
arch
uname
cat /var/log/dmesg
cat /sys/class/net/eno1/address #get MAC addres for given interface
lsusb
lsmod
id #get user info
xdpyinfo #get info about client display & graph server
#SUMMARY
lspci #command : List all PCI devices.
lshw #command : List all hardware.
dmidecode #command : List all hardware data from BIOS.
ifconfig #command : Outdated network config utility.
ip #command : Recommended new network config utility.
modinfo 'lshw -c video | awk '/configuration: driver/{print $2}' | cut -d= -f2' #discover videodriver 
dmesg -l err
dmesg | tail -20
watch "dmesg | tail -20"
sudo blkid -sUUID #usb drive unique id

#password change
sudo passwd root # in ubuntu
sudo passwd username #change password for  user

#HD & MEMORY
free -m
sudo fdisk -l
df -h #df is acronym Disk Free
lsblk
lsblk -o NAME,FSTYPE,LABEL,MOUNTPOINT,SIZE,MODEL #short 'by table' info on all drives
df #without anything
df -ah #procentage of used space
df -k #memory usage
df -i #inode information in output

#TEST HDD BAD BLOCKS
upower -i /org/freedesktop/UPower/devices/battery_BAT0  - test battery & hdd health linux
sudo smartctl -a /dev/sda
sudo badblocks -v /dev/sdb1
sudo blkid

#RAM frequency?
sudo dmidecode | grep -i speed

#cron
crontab -e #edit cron jobs
/etc/crontab #location of crontab

#ifup
ifup eth0 #enable inteface
ifdown eth0 #disable

#/*
#*The alias command makes it possible to launch any command or group of commands
#*(inclusive of any options, arguments and redirection) by entering a pre-set string
#*(i.e., sequence of characters).
#*/
gedit ~/.bashrc
alias shortname='sudo ping 192.168.1.100'
alias [-p] [name="value"]
-p option
alias l="ls -a"
alias p="pwd"
unalias [-a] name(s)

#SYSTEM INFO
uname -a # information about system
cat /etc/*-release # !!! VERY EFFICIANT
uname   -s
	-r
	-m
	-o
top
dstat
iostat
mpstat
lscpu
lspci
dmidecode
stat .bash_history #stat on given file, gets info on file
jobs #list of programs running on the background
cat /proc/scsi/scsi #info about hdd
whatis # display the on-line manual descriptions
apropos # search the manual page names and descriptions

#PS
ps -A|grep apache #getting pid 1174
ps --ppid 1174 #list all the child processes
ps aux | grep 'Z' #show zombie process
ps axo pid=,stat= | awk '$2~/^Z/ { print }' #same trick with awk
ps -ef #will give a full list of processes
ps -f -u jsavely #all process run by user
ps -C apache2 #search the processes by their name
watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15' #realtime process view
ps aux | grep "chrome-stable" #process info
pgrep chrome #all pid by given program
ps -axu #ALL the processes very useful!
ps axo user --no-heading |sort|uniq -c #how many processes is running under what names
ps aux --sort -rss #list processes by memory usage

#CAT
cat > myFile.txt #creates file and puts linesinto it(ctrl+D to save) remember >> adds new info
cat -bs file1.txt #numbers the lines in given file
cat * > merged-file.txt # Uite(merge) all files in directory to one file
cat /proc/cpuinfo  | grep "model name" #model of CPU


#INSTALING WITH DPKG
dpkg -i package-name-here.deb
dpkg --install package-name-here.deb
dpkg -i -R /path/to/dir/name/with/lots/of/dot-deb-files/
dpkg -i --recursive /path/to/dir/name/with/lots/of/dot-deb-files/
sudo apt-get remove uex

#TREE
pstree -p #cool tree of all processes
tree -p #tree everything in current directory

#log
lnav #syslog by default. lnav is colored log files viver
lnav /var/log/dpkg.log /var/log/kern.log
lnav Xorg.0.log

#installing and removing OpenOffice
sudo apt-get remove --purge libreoffice* libexttextcat-data* && sudo apt-get autoremove
wget http://sourceforge.net/projects/openofficeorg.mirror/files/4.0.0/binaries/en-US/Apache_OpenOffice_4.0.0_Linux_x86-64_install-deb_en-US.tar.gz
tar -xvf Apache_OpenOffice*.tar.gz
sudo dpkg -i en-US/DEBS/*.deb
sudo dpkg -i en-US/DEBS/desktop-integration/*.deb
sudo apt-get purge openoffice*.* && sudo apt-get autoremove
sudo apt-get install libreoffice libreoffice-gnome

#apt
apt-get -h #if help

	update  #Retrieve new lists of packages
	upgrade  #Perform an upgrade
	install  #Install new packages (pkg is libc6 not libc6.deb)
	remove  #Remove packages
	purge  #Remove packages and config files
	autoremove  #Remove automatically all unused packages
	dist-upgrade  #Distribution upgrade
	dselect-upgrade  #Follow dselect selections
	build-dep  #Configure build-dependencies for source packages
	clean  #Erase downloaded archive files
	autoclean  #Erase old downloaded archive files
	check  #Verify that there are no broken dependencies
	source  #Download source archives
	download  #Download the binary package into the current directory
	changelog  #Download and display the changelog for the given package
sudo apt-cache --help
		showsrc #Show source records
		search #Search the package list for a regex pattern
  		depends #Show raw dependency information for a package
  		rdepends #Show reverse dependency information for a package
  		show #Show a readable record for the package
  		pkgnames #List the names of all packages in the system
  		policy #Shows if and what package is installed
#example: sudo apt-cache  policy firefox
sudo apt deb AnyPackageName.deb #install deb with apt
sudo apt download apache2 #download binary
sudo debsums #check md5sum of package
sudo debsums --config #checks only configs
sudo debsums --changed
sudo debsums apache2 #particular package check
apt-get install --only-upgrade apache2 #only upgrade package
sudo apt list --installed | grep -i bluetooth #list all packages related
whereis packagename firefox #returns location of the installed file

#CHROMIUM RUN
chromium-browser  --proxy-server=192.168.1.220:3128

#Environment VARIABLES
env
env | grep PATH
PATH="/usr/local/exapmle_dir_name/arm/bin:$PATH"
PATH=/usr/local/Trolltech/Qt-4.8.6/bin:$PATH
export PATH
echo $PATH
export PATH=$PATH:directory
mkdir bin

#encrypt file
openssl enc -aes-256-cbc -in /home/jsavely/file1.txt -out /home/jsavely/file1.dat #encrypt
openssl enc -aes-256-cbc -d -in /home/jsavely/file1.dat > /home/jsavely/file1.txt #decrypt
zip --password xxxxx myfiles.zip file1.txt file2.txt file3.txt #cerates encrypded archive
unzip myfiles.zip # unzips after password

sudo apt-get install ccrypt #unility for encryption
ccrypt -e file #e for encrypt
ccrypt -c file # like ccat, look through the file
ccrypt -d file.cpt # for decrypt

#KILL PROCESS
killall proc_name
ps -aef | grep proc_name
kill  pid1 pid2 pid3
kill -15  pid1 pid2 pid3
kill -9  pid1 pid2 pid3
kill  -9 3546 5557 4242

#COPY\RIP ISO
mkisofs -r -o file.iso /dev/dvd
cat /dev/sr0 > image.iso
cat /dev/scd0 > /home/jsavely/test.iso

#GREP
grep - #search for file or line in file by given templeate
grep "myTempleate"
grep -r "myTempleate" #recursive search
grep -c "myTempleate" #outputs count of templeates
grep -i "myTempleate" #igrores register
grep -oP '\S*\SEARCHED_WORD(?=\s|$)' file_name.txt #search through the file and find the pattern
ccrypt -c regs.cpt |grep wordThatISearchFor  -A5 -B5 # +5 lines from above and below 

#sed
sed -i 's/:/?/g' HollandTest.txt #replace ALL : symbols to ? symbols within given file
sed -r 's/[:]+/?/g' HollandTest.txt #replace ALL : symbols to ? symbols within given file and put result on cli
sed '' test.txt #simmilar to cat, outputs all file contais
sed -e :a -e '/^\n*$/{$d;N;ba' -e '}'  HollandTest.txt #delets all the empty lines at the end of the files
sed 's/word1/word2/' test.txt #search and replace word1 to word2
sed '1s/word1/word2/' test.txt #search and replace word1 to word2 in first string or any string numbered
sed 's/t/T/g' test.txt #serch for uppercae 'T' and replace with lover case 't'. g is for global
sed -i 's/word1/word2/ ; s/word3/word4/' test.txt #search and replace one words with the other words
aspell #dig theat command

#MOUNT VOLUME
sudo mount -o loop /media/jsavely/web/iso/kubuntu-15.04-desktop-amd64.iso  /media/iso #command as follows to mount iso file called disk1.iso
sudo mount /dev/fd0 /mnt
umount /mnt #unmount forom mnt
umount -a #standing in the directory unmount all
sudo mount -o remount,rw /partition/identifier /mount/point

#FFMPG SETUP
export PATH=$PATH:/home/opt/ffmpeg/bin
ffmpeg -i Interstellar1080p.mkv -vf scale=-1:720 -c:v libx264 -crf 0 -preset veryslow -c:a copy Interstellar720p.mkv
ffmpeg -f v4l2 -list_formats all -i /dev/video0
ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 output.mpg
ffmpeg -f video4linux2 -list_formats all -i /dev/video0
ffmpeg -f video4linux2 -input_format mjpeg -i /dev/video0 -c:v copy output.mkv
ffmpeg -f v4l2 -i /dev/video0 -c:v libx264 -crf 23 -t 30 out.mp4 #stream

#CHMOD SYNTAX
chmod 754 myfile
chmod 700 myfile #good
chmod +x myFile.sh #make file executible
chown owner-user file
chown owner-user:owner-group file
chown owner-user:owner-group directory
chown options owner-user:owner-group file
chown vivek demo.txt
chown root /foo

#INSTALL/REINSTALL JDK MANUAL
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-7-openjdk-amd64/bin/java" 1
#this command notifies the system that Java JRE is available for use
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-7-openjdk-amd64/bin/javac" 1
#this command notifies the system that  Java JDK is available for use
sudo update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/bin/java
#this command will set the java runtime environment for the system
sudo update-alternatives --set javac /usr/lib/jvm/java-7-openjdk-amd64/bin/javac
#this command will set the javac compiler for the system
sudo update-alternatives --set javaws /usr/local/java/jdk1.8.0_20/bin/javaws
#this command will set Java Web start for the system

#EXECUTE JAVA
java -jar Minesweeper.jar - jar execute

#PARSE JSON VIA BASH
cat toParse.json | jq '.name'
cat toParse.json | jq '.employees[2].name'

echo -n "This is a very long line and I don't kwow how many symbols in it but I want to count." | wc -c

#RUN REMOTE APPLETS
javaws  http://192.168.1.220/fmg.jnlp

#PPP CONNECT
run "wvdial" to connect to the internet
wvdial connect

#write
write jsavely pts/9 #write username tty/X
ps ax | grep $$ | awk '{ print $2 }' #get current tty

#SPLIT FLAC
sudo apt-get install cuetools shntool flac
cuebreakpoints sample.cue | shnsplit -o flac sample.flac

#NETWORK MONITORING & STATISTICS TOOLS(init)
sudo /etc/init.d/network-manager restart
				 start
				 stop

ethtool -h
sudo iptraf
bmon
sudo tcptrack -i eth1
multitail /var/log/syslog -l "ping google.com"
sudo nethogs

netstat -i #BASIC
netstat -s
netstat -pt #which programs are active on the network!!!good
netstat -at #only TCP or UDP connections.list out only tcp  use the t option
netstat -ant #ALL TCP connections with NO dns resolution
netstat -tnl #only listening connections
sudo netstat -nlpt #Get process name/pid and user id
netstat -rn #kernel routing info
netstat -tulpn #fast info what's going in the system or what prog on what port

vnstat -l -i eno1 #eno1 is an interface the command is 'The monitor'
service vnstat status
vnstat
sudo tcpdump -w - -i eth0 -c 500 port 3128|strings >tcpTraf
#ip
ip addr add 192.168.50.5 dev eth1 #Assign a IP Address to Specific Interface
ip addr del 192.168.50.5/24 dev eth1  #Remove an IP Address
ip link set eth1 up #enables a network interface
ip link set eth1 down #disables a network interface
ip route show #shows routing table
ip route add 10.10.20.0/24 via 192.168.50.100 dev eth0  #routes to pass traffic from best way to reach the destination
ip route add default via 192.168.50.100 #add default gateway


#NETWORK SPEED
watch -n1 iwconfig                    wlan0
iwconfig wlan0 | grep -i --color signal
watch -n 1 cat /proc/net/wireless
wavemon

#ifconfig
ifconfig eth0 down #turn interface off
ifconfig -a #all information
ifconfig eth0 192.168.1.2 #set addres to interface
ifconfig eth0 netmask 255.255.255.240 #set netmask
ifconfig eth0 192.168.1.2 netmask 255.255.255.240 broadcast 192.168.1.15 #all in one line
ifconfig eth0 mtu 1400  #cahange MTU

#NETWORK SCANING
sudo nmap -sS -P0 -sV -O 192.168.1.220
sudo nmap -PN 192.168.1.1 #when protected
sudo nmap -iL /tmp/scanlist.txt --excludefile /tmp/exclude.txt #set scanlist & exclude list
sudo nmap --packet-trace 192.168.1.220 > tmp.nmap.txt
sudo nmap --iflist
sudo nmap -p T:80  cyberciti.biz
sudo nmap -sV  cyberciti.biz #!!!detect remote services (server / daemon) version numbers
nmap -T4 -sP 192.168.2.0/24 && egrep “00:00:00:00:00:00” /proc/net/arp #Find unused IPs on a given subnet
nmap -PS 192.168.1.1 #Scan a host using TCP ACK (PA) and TCP Syn (PS) ping
nmap -PS 80,21,443 192.168.1.1
nmap -PA 192.168.1.1
nmap -PA 80,21,200-512 192.168.1.1 #---------
nmap -sX 192.168.1.254 # Xmas flood atack
nmap --spoof-mac MAC-ADDRESS-HERE 192.168.1.1 # Spoof your MAC address ##
nmap -v -sT -PN --spoof-mac MAC-ADDRESS-HERE 192.168.1.1 # Add other options ###
nmap -v -sT -PN --spoof-mac 0 192.168.1.1 # Use a random MAC address The number 0, means nmap chooses a completely random MAC address ###
nmap -T5 192.168.1.0/24 #fastest way to SCAN all your devices/computers for open ports ever

iw wlan0 info
iw reg get #покажут вам, что вы можете.
#NETCAT
nc -v -w 1 localhost -z 1-3000 #to see what ports are open on a given machine
nc -lp 1337 > file.zip #File Transfer
nc -w 1 10.48.2.40 1337 < file.zip #File Transfer

#Cloning Hard Drive Partitions Over the Network
dd if=/dev/sda | nc 192.168.0.1 9000 #On a system you want to clone do
nc -l -p 9000 | dd of=/dev/sda #On the receiving side

#Chat Server
nc -lp 1337 #start listening to connections on some port
nc 10.48.2.40 1337 #on another machine connect to that port
# start typing on either machine. When you press enter, the line will immediately show up on the other machine


#"VIRUS" CHECK
jsavely@dell:/home/prj/chkrootkit-0.50$ sudo ./chkrootkit > check4rootkits.txt

#RESTART XFCE
sudo service lightdm restart
xfce4-panel -r &

#CURL
curl http://www.google.com > googlePareFun.html #get pare and put it into the file !bonus! time and other stats
curl -u username:password URL #authentificate on page
curl -u ftpuser:ftppass -T myfile.txt ftp://ftp.testserver.com #upload file to ftp
curl -u ftpuser:ftppass -T "{file1,file2}" ftp://ftp.testserver.com #upload multiple files to ftp
curl -x proxysever.test.com:3128 http://google.co.in # download file via proxy
curl --proxy 11.22.33.44:5555 check-host.net/ip # Проверить HTTP proxy
curl --proxy 11.22.33.44:5555 -U username:password check-host.net/ip # Тоже самое, но если для HTTP proxy требуется авторизация
curl --socks4 11.22.33.44:5555 check-host.net/ip # Проверить socks4
curl --socks5 11.22.33.44:5555 check-host.net/ip # Проверить socks5
# Тоже самое, только преобразование имен идет также через SOCKS
# (подробнее о преобразовании имен можно прочитать ниже в подразделе "DNS запросы через proxy")
curl --socks5-hostname 11.22.33.44:5555 check-host.net/ip
curl ifconfig.me # MY EXTERNAL IP
curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//' # MY EXTERNAL IP


#LAMP install
sudo apt-get install apache2
sudo apt-get install mysql-server
sudo apt-get install php5 libapache2-mod-php5
sudo /etc/init.d/apache2 restart
#go browser
http://localhost/
php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'

#systemctl
systemctl status  udev #is a multitool for system status
sudo systemctl set-default runlevel3.target #change runlevel
sudo systemctl reboot #Power management
               poweroff
               hibernate
     systemctl list-units
systemctl --failed # failed load
systemctl enable unit-name
systemctl disable unit-name
systemctl daemon-reload
journalctl -b #all msg from the moment of loading
journalctl --since="2012-10-30 18:17:16"
journalctl -f #only new messages as they oocurs
journalctl --since "30 min ago"
journalctl -xn
journalctl -u nginx


#LS POWER
ls -1 #show single entry per line
ls -l #long info
ls -lt #sort by time modify
ls -lhS #by size
ls -a # list all(evrything)
ls -R #list  Recursively
ls --color=auto # colorise
ls -lh #SIZE OF FILES IN DIRECTORY(THAT ONE IS BETTER!)
ls -l --block-size=M #SIZE OF FILES IN DIRECTORY
ls -lst /dev/video* #list of devices
ls -l /bin/gzip #all atriutes of the file
ls –l *.lock #list all files with *.lock extension

#sort
sort -bf fileOneTest.txt #sort alphabeticaly
sort mix.txt
sort file1.txt file2.txt > file3.txt #margin two documents
sort #has a lot of options to dig

#STEGANOGRAPHY
sudo apt-get install steghide
steghide embed -cf pictureName.jpg -ef sicretText.txt
steghide extract -sf autumn.jpg

#install arduino
#download from official site and unpack stuff to /opt directory
#than
sudo chmod a+rw /dev/ttyACM0

#SSH
#Строим туннель из сети в мир.
$ ssh -f -N -R 2222:10.11.12.13:22 username@99.88.77.66
#теперь введя на хосте 99.88.77.66:
$ ssh -p2222 localhost
#мы попадём на хост 10.11.12.13.
#Таким-же образом можно получить доступ к любому другому ресурсу, например:
$ ssh -f -N -R 2080:10.11.12.14:80 username@99.88.77.66
#Введя на хосте 99.88.77.66:
$ w3m -dump http://localhost:2080
#получим дамп web-ресурса на 10.11.12.14.
#Строим туннель из мира в сеть.
$ ssh -f -N -L 4080:192.168.0.10:80 nameuser@88.77.66.55
#Аналогично, вводим на своём хосте:
$ w3m -dump http://localhost:4080
#и получаем доступ к web-ресурсу узла 192.168.0.10, который находится за хостом 88.77.66.55.
#Mount folder/filesystem through SSH
sshfs name@server:/path/to/folder /path/to/mount/point
#SSH connection through host in the middle
ssh -t reachable_host ssh unreachable_host
# Attach screen over ssh
ssh -t remote_host screen -r
#Port Knocking!
knock <host> 3000 4000 5000 && ssh -p <port> user@host && knock <host> 5000 4000 3000
#establish a remote Gnu screen session
ssh -t user@some.domain.com /usr/bin/screen -xRR

ssh-keygen #generate key
ssh-keygen -b 4096
ssh-copy-id username@remote_host
ssh username@remote_IP_host


#(AMD PROP DRIV)fglrxinfo
watch aticonfig --odgt
fglrxinfo

#BACKUP A WEBSITE
rsync -vare ssh jono@192.168.0.2:/home/jono/importantfiles/* /home/jono/backup/

#DATABASES
mysqlcheck -o <databasename>

#bluetooth check
hcitool dev
rfkill list
bluewho
sudo service bluetooth restart
sudo service bluetooth status
hciconfig -a hci0
sudo hciconfig hci0 up
#WHOIS
whois 216.58.209.206
whois google.com

route #shows and manipulate ip routing table
route add default gw 192.168.1.1

#ANDROID
#copy application
adb shell pm list packages
adb shell pm path com.vMEyeSuperHD.ui
adb pull /data/app/com.vMEyeSuperHD.ui-1/base.apk
sh /home/jsavely/AndroidStudioProjects/rcd/dex2jar2/d2j-dex2jar.sh /home/jsavely/AndroidStudioProjects/rcd/vMEyeSuper.apk

#emulator 
cd /AndroidSDK/.../emulator
emulator -list-avds
emulator -avd Nexus_5X_API_23

#decompile res files
apktool d vMEyeSuper.apk

#ADB Debugging
adb devices
adb forward
adb kill-server
#wireless
adb connect
adb usb
#Package Manager
adb install
adb uninstall
adb shell pm list packages
adb shell pm path
adb shell pm clear
#File Manager
adb pull
adb push
adb shell ls
adb shell cd
adb shell rm
adb shell mkdir
adb shell touch
adb shell pwd
adb shell cp
adb shell mv
#Network
adb shell netstat
adb shell ping
adb shell netcfg
adb shell ip
#Logcat
adb logcat
adb shell dumpsys
adb shell dumpstate
#Screenshot
adb shell screencap
adb shell screenrecord [4.4+]
#System
adb root
adb sideload
adb shell ps
adb shell top
adb shell getprop
adb shell setprop

adb backup -f c:\android\backup.ab -apk -all -nosystem
adb restore c:\android\backup.ab

adb start-server #backup step1
adb backup -apk -shared -all -f backup-xiaomi.adb #step2 backup phone

#console inside console
adb shell
+
su

#Xfce 4 Window Manager Keyboard Shortcuts
Alt + F4	#Close window
Alt + F5	#Maximize window
Alt + F6	#Maximize vertically
Alt + F7	#Maximize horizontally
Alt + F8	#Hide window
Alt + F9	#Shade window
Alt + F10	#Stick window
Alt + Tab	#Cycle windows focus
Ctrl + Shft + Alt + Arrow (up, down, left, or right)	#Move window
Shft + Alt + Arrow (up, down, left, or right)	#Resize window
Shft + Alt + Page_Up	#Raise window
Shft + Alt + Page_Down	#Lower window
Alt + F11	#Toggle fullscreen
Ctrl + Alt + Arrow right arrow	#Next workspace
Ctrl + Alt + Arrow left	#Previous workspace
Alt + Insert	#Add a workspace
Alt + Delete	#Delete a workspace
Ctrl + F(N)	#Go to workspace number N (1-9)
Alt + Ctrl + Home|End	#Move the window to previous|next workspace
Alt + Ctrl + keypad key number N	#Move a window to workspace number N (1-9)
Alt + F1	#Start xfhelp4
Alt + F2	#Start xfrun4
Alt + Ctrl + Delete	#Lock the screen

#MJPG streamer
./mjpg_streamer -i "./input_uvc.so -d /dev/video1 -f 30 -r 1280x720" -o "./output_http.so -w ./www"
cd mjpg-streamer
make clean all
make USE_LIBV4L2=true clean all
sudo make DESTDIR=/usr install
export LD_LIBRARY_PATH=.
./mjpg_streamer -o "output_http.so -w ./www"
sudo fswebcam --verbose #Test If cameras are streaming

#VirtualBox
VBoxManage sharedfolder add "kubuntu" --name "share" --hostpath "/home/jsavely/share"

#CLOCKS in bash
watch -n 0.1  time date -R

#bash Shortcuts
	CTRL-A	Перемещение курсора в начало строки
	CTRL-E	Перемещение курсора в конец строки
	CTRL-R	Поиск по истории
	CTRL-W	Вырезать последнее слово
	CTRL-U	Вырезать всё до курсора
	CTRL-K	Вырезать всё после курсора
	CTRL-Y	Вернуть последнюю вырезанную строку
	CTRL-_	Отмена
	CTRL-L	Очистка экрана терминала

#find
find . -name tecmint.txt ./tecmint.txt # Find all the files whose name is tecmint.txt in a current working directory.
find /home -name tecmint.txt #Find all the files under /home directory with name tecmint.txt.
find /home -iname tecmint.txt #Find all the files whose name is tecmint.txt and contains both capital and small letters in /home directory.
find / -type d -name Tecmint #Find all directories whose name is Tecmint in / directory.
find . -type f -name tecmint.php #Find all php files whose name is tecmint.php in a current working directory.
find . -type f -name "*.php" #Find all php files in a directory.
find . -type f -perm 0777 -print #Find all the files whose permissions are 777.
find / -type f ! -perm 777 #Find all the files without permission 777.
find / -perm 2644 #Find all the SGID bit files whose permissions set to 644.
find / -perm 1551 #Find all the Sticky Bit set files whose permission are 551.
find / -perm /u=s #Find all SUID set files.
find / -perm /g=s #Find all SGID set files.
find / -perm /u=r #Find all Read Only files.
find / -perm /a=x #Find all Executable files.
find / -type f -perm 0777 -print -exec chmod 644 {} \; #Find all 777 permission files and use chmod command to set permissions to 644.
find / -type d -perm 777 -print -exec chmod 755 {} \; #Find all 777 permission directories and use chmod command to set permissions to 755.
find . -type f -name "tecmint.txt" -exec rm -f {} \; #To find a single file called tecmint.txt and remove it.
find . -type f -name "*.txt" -exec rm -f {} \; #To find and remove multiple files such as .mp3 or .txt, then use.
find /tmp -type f -empty #To find all empty files under certain path.
find /tmp -type d -empty #To file all empty directories under certain path.
find /tmp -type f -name ".*" #To find all hidden files, use below command.
find / -user root -name tecmint.txt #To find all or single file called tecmint.txt under / root directory of owner root.
find /home -user tecmint #To find all files that belongs to user Tecmint under /home directory.
find /home -group developer #To find all files that belongs to group Developer under /home directory.
find /home -user tecmint -iname "*.txt" #To find all .txt files of user Tecmint under /home directory.
find / -mtime 50 #To find all the files which are modified 50 days back.
find / -atime 50 #To find all the files which are accessed 50 days back.
find / -mtime +50 –mtime -100 #To find all the files which are modified more than 50 days back and less than 100 days.
find / -cmin -60 #To find all the files which are changed in last 1 hour.
find / -mmin -60 #To find all the files which are modified in last 1 hour.
find / -amin -60 #To find all the files which are accessed in last 1 hour.
find / -size 50M #To find all 50MB files, use.
find / -size +50M -size -100M #To find all the files which are greater than 50MB and less than 100MB.
find / -size +100M -exec rm -rf {} \; #To find all 100MB files and delete them using one single command.
find / -type f -name *.mp3 -size +10M -exec rm {} \; #Find all .mp3 files with more than 10MB and delete them using one single command.
find dir -name "pattern" 2>/dev/null #Finds all files which recursively apply to the pattern "pattern" starting from the directory "dir".
                                     #The 2> sends all error messages to the null device.
find . -name '*.java' -newer build.xml -print #Search for all java files newer than the file build.xml
find . -name '*.java' -mtime +7 -print #Search for all java files newer than 7 dates
find . -name '*.java' -mtime +7 -print0 #xargs -0 grep 'swt'

#imagemagik
convert -resize 50% input.jpg output.png #uses imagemagik to convetet image

#dpkg
dpkg -i {.deb package}
dpkg -i zip_2.31-3_i386.deb #Install the package
dpkg -i {.deb package}
dpkg -i zip_2.31-3_i386.deb #Upgrade package if it is installed else install a fresh copy of package
dpkg -R {Directory-name}
dpkg -R /tmp/downloads #Install all packages recursively from directory
dpkg -r {package}
dpkg -r zip	#Remove/Delete an installed package except configuration files
dpkg -P {package}
dpkg -P apache-perl #Remove/Delete everything including configuration files
dpkg -l
dpkg -l #List all installed packages, along with package version and short description
dokg -l | less
dpkg -l '*apache*'
dpkg -l | grep -i 'sudo'
dpkg -l {package}
dpkg -l apache-perl #List individual installed packages, along with package version and short description
dpkg -L {package}
dpkg -L apache-perl	#Find out files are provided by the installed package i.e. list where files were installed
dpkg -L perl
dpkg -c {.Deb package}
dpkg -c dc_1.06-19_i386.deb #List files provided (or owned) by the package i.e. List all files inside debian .deb package file,useful to find where files installed
dpkg -S {/path/to/file}
dpkg -S /bin/netstat #Find what package owns the file i.e. find out what package does file belong
dpkg -S /sbin/ippool
dpkg -p {package}
dpkg -p lsof	#Display details about package package group, version, maintainer, Architecture, display depends packages, description etc
dpkg -s {package} | grep Status #check if papackage is installed. very useful #example dpkg -s firefox | grep Status
dpkg -s lsof | grep Status	#Find out if Debian package is installed or not (status)

mysqldump -Q -c -e -u USER -pPASSWORD DATABASE > /path/to/file/dump.sql
mysqldump --add-drop-table --databases myDatabaseName > /home/jsavely/backup/db/$(/bin/date +\%Y-\%m-\%d).sql.bak
mysqldump --all-databases --all-routines > /path/to/fulldump.sql
mysql -u root -p [database_name] < backupName.sql #to restore database

#adduser
adduser username #createuser
usermod -aG sudo username #add the user to the sudo group
su - username # switch to the new user account
sudo ls -la /root #test if you a sudo-er

#lsof
lsof /home #list files in the directory
kill -9 'lsof -t -u username' #kill all processes for given user
sudo lsof -u jsavely #files of user
lsof -i  #network connections
lsof -i tcp; lsof -i udp; #same for protocols
lsof -i tcp:8082 #what process is on that port
lsof -i 4 -a -p 1234 #(просмотр всех соединений IPv4, открытых процессом с PID = 1234)
lsof /dev/hd4 # (Список открытых файлов на устройстве /dev/hd4)
lsof /dev/cdrom # (Список процессов, работающих с CD ROM)
lsof -c ssh #Список подключений по ssh
lsof -u jsavely | wc -l #!!!Files open by user (pentest important)
lsof -p 11123 # list files opend by the process(PID)!!!very useful

#slay
sudo slay jsavely #kill all process for given user

#md5sum
md5sum yesTest.txt > sumYesTest.txt #generate hash and save it to the file
md5sum /bin/* >> /home/jsavely/binCheck # create controll sum for check
md5sum -c /home/jsavely/etcCheck #check

#signal - overview of signals
man 7 signal #all about kill signal numbers
git init #Add the files in your new local repository. This stages them for the first commit.
git add . # Adds the files in the local repository and stages them for commit. To unstage a file, use 'git reset HEAD YOUR-FILE'.
git commit -m "First commit" #Commit the files that you've staged in your local repository.
# Commits the tracked changes and prepares them to be pushed to a remote repository.
#To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.
#Copy remote repository URL fieldAt the top of your GitHub repository's Quick Setup page,
#click to copy the remote repository URL.
#In Terminal, add the URL for the remote repository where your local repository will be pushed.
git remote add origin http://URL #Sets the new remote
git remote -v #Verifies the new remote URL #Push the changes in your local repository to GitHub.
git push origin master # Pushes the changes in your local repository up to the remote repository you specified as the origin
git config --list # lists your user settings username and email
git config user.name # shows my username
git config --global user.name "User Name"
git config --global user.email anyMail@gmail.com
git config --global core.editor "vim" # Set editor as vim
git config --global core.editor "edit -w" # Set editor as Text Wrangler Mac
git config --list # Show settings
git help OR git help [COMMAND] OR git help add
git diff # Shows what you changed, but haven't staged
git add AndroidManifest.xml # Stage file
git diff --cached # Shows what has been staged, but not committed
git log --oneline #show log compactly, oneline
#Remove a File 
rm DeleteMe.txt # If you remove a file it shows as "Changed but not updated"
git status # If you remove a file it shows as "Changed but not updated"
git rm DeleteMe.txt
git status # Shows that the file was deleted
#If you have committed a file to be removed you must add the -f option
git rm --cached DeleteMe.txt # Keep file, but remove from staging area
git mv DeleteMe.txt Delete.txt # Renames a file
#Log Commit History
git log # Shows all of the previous commit messages in reverse order
git log --pretty=oneline # Shows commits on one line
git log --pretty=format:"%h : %an : %ar : %s"
I. %h - Abbreviated Hash
II. %an - Authors Name
III. %ar - Date Changed
IV. %s - First Line of Comment
git log -p -2 # Shows the last 2 commit changes
git log --stat # Prints abbreviated stats
git log --since=1.weeks # Show only changes in the last week
git log --since="2014-04-12" # Show changes since this date
git log --author="Derek Banas" # Changes made by author
git log --before="2014-04-13" # Changes made before this date
git log --pretty=oneline # !!!very useful
#Undoing a Commit
#a. git commit --amend # If you want to change your previous commit
#b. Normally done if you forgot to stage a file, or to change the commit message
#3. Cloning a repository
git clone <remote url>
git fetch --all
git pull --all
#4. Create and delete branches
#To create your branch:
git checkout -b <branchName>
#To push a local git branch to remote:
git push -u origin <branch-name>
#To delete a local branch:
git branch -d <branch-name>
#To delete a remote branch:
git push origin --delete <branch-name>
#5. Stash and restore changes
#How to stash changes in git:
git stash #Save all local changes
git stash --patch //Save a specific file via interactive patch mode
#How to restore stashed changes:
git apply #Preserve changes in the stack
git stash pop #Discard changes from the stack.
#6. Reset a branch to the remote
#Confirm local changes:
git status
#Reset to the latest commit on remote / upstream:
git reset --hard HEAD
#7. Tag
#To create a lightweight tag:
#A lightweight tag is very much like a branch that doesn’t change — it’s just a pointer to a specific commit.
git tag <tag-name>
#To create an annotated tag:
git tag -a <tag-name> -m "tagging-message"
#To push local tags to remote:
git push origin <tag-name>
#If you have a lot of tags that you want to push up at once, you can also use:
git push --tags
#Another options, links local and remote tags:
git push --follow-tags
#Tagging later:
git tag -a <tag-name> <commit-id>
#To delete a local tag:
git tag -d <tag-name>
#To delete a remote tag:
git tag -d <tag-name>
git push -d origin <tag-name>
#8. Removing the last commit
#To remove the last commit:
git reset --hard HEAD^
#Removing multiple commits from the top:
#You can increase the number to remove even more commits.
git reset --hard HEAD~2 //remove the last two commits.
#To update changes in remote:
git push origin -f <branch-name>
#9. Reworking the last commit
#To perform significant work on the last commit:
git reset HEAD^
#10. Updating the last commit message
#Commit has not been pushed:
git commit --amend
#Commit has been pushed:
#git commit --amend(дополнен)
git push origin -f <branch-name>
#11. Rebase
#Standard rebasing:
#Automatically take the commits in your current working branch and apply them to the head of the passed branch.
git rebase
#Interactive rebasing:
git rebase --i
#This opens an editor where you can enter commands (described below) for each commit to be rebased. 
#These commands determine how individual commits will be transferred to the new base. 
#You can also reorder the commit listing to change the order of the commits themselves. 
#Once you’ve specified commands for each commit in the rebase, Git will begin playing back commits applying the rebase commands. The rebasing edit commands are as follows:
git rebase -i HEAD^^ #step back one commit
git rebase -i baf8d5e7da9e41fcd37d63ae9483ee0b10bfac8e^ #second way  to do the same
git log --pretty=format:"%H [%cd]: %an - %s" --graph --date=format:%c  #beutification for git log
#
ls -al # форматированный список со скрытыми каталогами и файлами
rm file # удалить file
rm -r dirName # удалить каталог dirName
rm -f file # удалить форсированно file
rm -rf dirName # удалить форсированно каталог dirName *
cp file1 file2 # скопировать file1 в file2
cp -r dirName1 dirName2 # скопировать dirName1 в dirName2; создаст каталог dirName2, если он не существует
mv file1 file2 # переименовать или переместить file1 в file2. если file2 существующий каталог - переместить file1 в каталог file2
ln -s file link # создать символическую ссылку link к файлу file
touch file # создать file
cat > file # направить стандартный ввод в file
more file # вывести содержимое file
head file # вывести первые 10 строк file
tail file # вывести последние 10 строк file
tail -f file # вывести содержимое file по мере роста, начинает с последних 10 строк
#Управление процессами
kill pid # убить процесс с id pid
killall proc # убить все процессы с именем proc *
bg # список остановленных и фоновых задач; продолжить выполнение остановленной задачи в фоне
fg # выносит на передний план последние задачи
fg n # вынести задачу n на передний план
#Примеры:
chmod 777 # чтение, запись, исполнение для всех
chmod 755 # rwx для владельца, rx для группы и остальных.
#Дополнительные опции: man chmod.
#SSH
ssh user@host # подключится к host как user
ssh -p port user@host # подключится к host на порт port как user
ssh-copy-id user@host # добавить ваш ключ на host для user чтобы включить логин без пароля и по ключам
#Поиск
grep -r pattern dirName # искать рекурсивно pattern в dirName
command | grep pattern # искать pattern в выводе command
locate file # найти все файлы с именем file
Системная информация
date # вывести текущую дату и время
cal # вывести календарь на текущий месяц
uptime # показать текущий аптайм
w # показать пользователей онлайн
whoami # имя, под которым вы залогинены
finger user # показать информацию о user
uname -a # показать информацию о ядре
cat /proc/cpuinfo # информация ЦПУ
cat /proc/meminfo # информация о памяти
man command # показать мануал для command
df # показать инф. о использовании дисков
du # вывести “вес” текущего каталога
free # использование памяти и swap
whereis app # возможное расположение программы app
which app # какая app будет запущена по умолчанию
# Архивация
tar cf file.tar files # создать tar-архив с именем file.tar содержащий files
tar xf file.tar # распаковать file.tar
tar czf file.tar.gz files # создать архив tar с сжатием Gzip
tar xzf file.tar.gz # распаковать tar с Gzip
tar cjf file.tar.bz2 # создать архив tar с сжатием Bzip2
tar xjf file.tar.bz2 # распаковать tar с Bzip2
gzip file # сжать file и переименовать в file.gz
gzip -d file.gz # разжать file.gz в file
#Сеть
ping host # пропинговать host и вывести результат
whois domain # получить информацию whois для domain
dig domain # получить DNS информацию domain
dig -x host # реверсивно искать host
wget file # скачать file
wget -c file # продолжить остановленную закачку
#Установка из исходников:
./configure
make
make install
dpkg -i pkg.deb # установить пакет (Debian)
rpm -Uvh pkg.rpm # установить пакет (RPM)
Клавиатурные сочетания
Ctrl+C # завершить текущую команду
Ctrl+Z # остановить текущую команду, продолжть с fg на переднем плане или bg в фоне
Ctrl+D # разлогиниться, тоже самое, что и exit
Ctrl+W # удалить одно слово в текущей строке
Ctrl+U # удалить строку
!! - повторить последнюю команду
exit # разлогиниться
echo "nameserver 1.1.1.1" > /etc/resolv.conf #set my dns server
#nano
На слово вперёд — Ctrl-Space
На слово назад — Alt-Space (курсор встаёт в начале слова)
В начало файла — Alt-| или Alt-\ (короче, Alt- и «эта» кнопка)
В конец файла — Alt-/ или Alt-? (аналогично, Alt «эта» кнопка)
До первой пустой строки вниз — Alt-0 (или Alt-))
До первой пустой строки вверх — Alt-9 (или Alt-()
(в терминах nano текст, отделённый пустыми строками называется «параграф», так что последние две команды называются «предыдущий параграф», «следующий параграф»)
Включить выключить перенос строк — Alt-L
Переход на строку с указанным номером — Alt-G
Ctrl+G или F1 - Показать эту справку
Ctrl+X или F2 - Закрыть текущий буфер / Выйти из nano
Ctrl+O или F3 - Записать текущий файл на диск
Ctrl+J или F4 - Выровнять текущий абзац
Ctrl+R или F5 - Вставить другой файл в текущий
Ctrl+W или F6 - Искать текст или регулярное выражение
Ctrl+Y или F7 - Перейти на предыдущий экран
Ctrl+V или F8 - Перейти на следующий экран
Ctrl+U или F10 - Вставить содержимое буфера обмена в текущую строку
Ctrl+C или F11 - Показать положение курсора
Ctrl+T или F12 - Проверить орфографию, если доступно
Ctrl+K или F9 - Вырезать текущую строку и сохранить её в буфере обмена
m+\ или m+| - На первую строку файла
m+/ или m+? - На последнюю строку файла
Ctrl+_ или m+G - Перейти на указанный номер строки и ряд
Ctrl+\ или m+R - Заменить текст или регулярное выражение
Ctrl+^ или m+Alt - Отметить текст в текущей позиции курсора
m+W - Повторить последний поиск
m+^ или m+6 - Копировать текущую строку и сохранить ее в буфере обмена
m+} - Увеличить отступ строки
m+{ - Уменьшить отступ строки
Ctrl+F - Вперёд на один символ
Ctrl+B - Назад на один символ
Ctrl+Space - Вперёд на одно слово
m+Space - Назад на одно слово
Ctrl+P - На предыдущую строку
Ctrl+N - На следующую строку
Ctrl+Alt - На начало текущей строки
Ctrl+E - В конец текущей строки
m+( или m+9 - На начало текущего абзаца; потом следующего абзаца
m+) или m+0 - В конец текущего абзаца; потом следующего абзаца
m+] - На соответствующую скобку
m+− или m+_ - Прокрутить одну строку вверх, не перемещая курсор
m++ или m+= - Прокрутить одну строку вниз, не перемещая курсор
m+< или m+, - Переключить на предыдущий буфер
m+> или m+. - Переключить на следующий буфер
m+V - Вставить следующую комбинацию клавиш как есть
Ctrl+I - Вставить табуляцию в позиции курсора
Ctrl+M - Вставить строку в позиции курсора
Ctrl+D - Удалить символ под курсором
Ctrl+H - Удалить символ слева от курсора
m+T - Вырезать с текущей позиции до конца файла
m+J - Выровнять весь файл
m+D - Подсчитать количество слов, строк и символов
Ctrl+L - Обновить текущий экран
Ctrl+Z - Приостановить редактор (если включено)
m+X - Режим справки разрешить/запретить
m+C - Постоянное отображение положения разрешить/запретить
m+O - Использование дополнительной строки для редактирования разрешить/запретить
m+Shift - Плавная прокрутка разрешить/запретить
m+P - Отображение пробелов разрешить/запретить
m+Y - Подсветка синтаксиса разрешить/запретить
m+H - Умная кнопка home разрешить/запретить
m+I - Автоотступы разрешить/запретить
m+K - Вырезать до конца разрешить/запретить
m+L - Автоматическая разбивка строк разрешить/запретить
m+Q - Преобразование ввода табуляций в пробелы разрешить/запретить
m+B - Делать резервные копии разрешить/запретить
m+F - Несколько файловых буферов разрешить/запретить
m+M - Поддержка мыши разрешить/запретить
m+N - Без преобразования из формата DOS/Mac разрешить/запретить
m+Z - Приостановка разрешить/запретить
m+$ - Мягкий перенос строк разрешить/запретить
#In nano's help texts the Ctrl is represented by a caret (^), so Ctrl + W
#is shown as ^W, and so on.
#The Alt key is represented by an M (from "Meta"), so Alt + W is shown as M-W.

nice -n18 nano fileOneTest.txt # run process with some level of privilage

#pgrep
pgrep -lvu root #all processes that do not belong to root
pgrep -fl chrome #list all processes related to given
pgrep -u root sshd #show all PID's of given process for given user
pgrep -l dbus #find  PID's by a part of the name

#qemu
qemu-img create -f qcow2 my-image.qcow2 10G
qemu-system-x86_64 -cdrom /home/jsavely/ubuntu-18.04.1-desktop-amd64.iso my-image.qcow2 -m 2G -enable-kvm
qemu-system-x86_64 my-image.qcow2 -m 2G -enable-kvm #if system was installed

#tar
tar -cvf photos ~/photos #create archive
tar -xvf tarfile #extract files

#wget
wget --spider -S http://google.com #load page
ls /home/jsavely/dumps |wc -l # count files in directory
sudo chkrootki #check for rootkits
find /bin -perm -4000 #find all binarys with SUID set
sed 's/^.\{5\}//g' docker_experement.txt #delete first 5 charachters at the begining of evry line
hostname --ip-address #get ip address  without ifconfig
rename 's/old-name/new-name/' files #rename multiple files [* if rename all]
rename 's/\.html$/\.php/' *.html #rename all file by given extension
#dist upgrde ubuntu
lsb_release -a #distro info
sudo apt update
sudo sed -i 's/artful/bionic/g' /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt update
sudo apt autoremove
sudo apt clean
sudo reboot
lsb_release -a
speedtest-cli #test network speed on ookla servers

# Download the security key for the Jenkins repository & add it to the keychain
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
# Add the Jenkins sources to apt
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
# Update the list of packages
sudo apt-get update
# Install Jenkins (will also install its dependencies, eg OpenJDK)
sudo apt-get install jenkins
sudo service jenkins restart
sudo service jenkins stop
sudo service jenkins start

#ClamAV scan example
clamscan -i -r –bell –max-dir-recursion 50 –copy /home/setevoy/Infected/ –log=/var/log/clamav.log /media/1C6A-19CC/
clamscan -r --bell -i /home/jsavely/Downloads/visample
clamscan -r / #To check all files on the computer, displaying the name of each file
clamscan -r --bell -i / #check all files, display infected and ring
clamscan -r -i / & #scan all files but only display infected when found, run in background
clamscan -r /home #check files in the all users home directories
clamscan -r --move=/home/USER/VIRUS /home/USER #check files in  USER home dir, move infected to another folder

ps aux | awk '{print $6/1024 " MB\t\t" $11}' | sort -n #find memorylicks
wc !* #count words and lines for file that was prinviously opened
#Android backup
adb start-server
adb devices
cd /media/jsavely/Seagate/
adb backup -apk -noshared -all -f backup-smartfon.adb
gpg -c fizzBuzz.txt #encrypt file
gpg fizzBuzz.txt.gpg #decrypt file
dd if=kali-linux-2017.1-amd64.iso of=/dev/sdb bs=512k #create kali liveISO
file t8rm.sh #shows info about file

#install postgresql
sudo apt-get install postgresql postgresql-contrib
sudo -i -u postgres
psql

mtr google.com #ping+traceroute+watch in one
dpkg --list | grep linux-image #show all kernels

#installing atom text editor
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update
sudo apt-get install atom

#who logs into the system
last jsavely
last root

netstat -anlp |grep 80 #who is listening on this port
watch -n 0.1 "dmesg | tail -n $((LINES-6))" #watch kernel messages live
sudo udevadm info -a -p /sys/class/net/eth0  #full info abut device, this case  network card
systemctl list-units #list all runned units by systemd
ldd /bin/ls  #list all the libs that binary uses
id #shows info about current user
stat #shows statistic about file
iperf3 -c iperf.donapex.net -R #testing network speed -R is a reverse mode
#4 – USER INFORMATION AND MANAGEMENT
# Display the user and group ids of your current user.
id
# Display the last users who have logged onto the system.
last
# Show who is logged into the system.
who
# Show who is logged in and what they are doing.
w
# Create a group named "test".
groupadd test
# Create an account named john, with a comment of "John Smith" and create the user's home directory.
useradd -c "John Smith" -m john
# Delete the john account.
userdel john
# Add the john account to the sales group
usermod -aG sales john
#5 – FILE AND DIRECTORY COMMANDS
# List all files in a long listing (detailed) format
ls -al
# Create a directory
mkdir directory
# Remove (delete) file
rm file
# Remove the directory and its contents recursively
rm -r directory
# Force removal of file without prompting for confirmation
rm -f file
# Forcefully remove directory recursively
rm -rf directory
# Copy file1 to file2
cp file1 file2
# Copy source_directory recursively to destination. If destination exists, copy source_directory into destination, otherwise create destination with the contents of source_directory.
cp -r source_directory destination
# Rename or move file1 to file2. If file2 is an existing directory, move file1 into directory file2
mv file1 file2
# Create symbolic link to linkname
ln -s /path/to/file linkname
# Create an empty file or update the access and modification times of file.
touch file
# View the contents of file
cat file
# Browse through a text file
less file
# Display the first 10 lines of file
head file
# Display the last 10 lines of file
tail file
# Display the last 10 lines of file and "follow" the file as it grows.
tail -f file
#6 – PROCESS MANAGEMENT
# Display your currently running processes
ps
# Display all the currently running processes on the system.
ps -ef
# Display process information for processname
ps -ef | grep processname
# Display and manage the top processes
top
# Interactive process viewer (top alternative)
htop
# Kill process with process ID of pid
kill pid
# Kill all processes named processname
killall processname
# Start program in the background
program &
# Brings job n to the foreground
fg n
#7 – FILE PERMISSIONS
Linux chmod example
        PERMISSION      EXAMPLE

         U   G   W
        rwx rwx rwx     chmod 777 filename
        rwx rwx r-x     chmod 775 filename
        rwx r-x r-x     chmod 755 filename
        rw- rw- r--     chmod 664 filename
        rw- r-- r--     chmod 644 filename

# NOTE: Use 777 sparingly!

        LEGEND
        U = User
        G = Group
        W = World

        r = Read
        w = write
        x = execute
        - = no access

#8 – NETWORKING
# Display all network interfaces and ip address
ifconfig -a
# Display eth0 address and details
ifconfig eth0
# Query or control network driver and hardware settings
ethtool eth0
# Send ICMP echo request to host
ping host
# Display whois information for domain
whois domain
# Display DNS information for domain
dig domain
# Reverse lookup of IP_ADDRESS
dig -x IP_ADDRESS
# Display DNS ip address for domain
host domain
# Display the network address of the host name.
hostname -i
# Display all local ip addresses
hostname -I
# Download http://domain.com/file
wget http://domain.com/file
# Display listening tcp and udp ports and corresponding programs
netstat -nutlp
#9 – ARCHIVES (TAR FILES)
# Create tar named archive.tar containing directory.
tar cf archive.tar directory
# Extract the contents from archive.tar.
tar xf archive.tar
# Create a gzip compressed tar file name archive.tar.gz.
tar czf archive.tar.gz directory
# Extract a gzip compressed tar file.
tar xzf archive.tar.gz
# Create a tar file with bzip2 compression
tar cjf archive.tar.bz2 directory
# Extract a bzip2 compressed tar file.
tar xjf archive.tar.bz2
#10 – INSTALLING PACKAGES
# Search for a package by keyword.
yum search keyword
# Install package.
yum install package
# Display description and summary information about package.
yum info package
# Install package from local file named package.rpm
rpm -i package.rpm
# Remove/uninstall package.
yum remove package
# Install software from source code.
tar zxvf sourcecode.tar.gz
cd sourcecode
./configure
make
make install
#11 – SEARCH
# Search recursively for pattern in directory
grep -r pattern directory
# Find files and directories by name
locate name
# Find files in /home/john that start with "prefix".
find /home/john -name 'prefix*'
# Find files larger than 100MB in /home
find /home -size +100M
#12 – SSH LOGINS
# Connect to host as your local username.
ssh host
# Connect to host as user
ssh user@host
# Connect to host using port
ssh -p port user@host
#13 – FILE TRANSFERS
# Secure copy file.txt to the /tmp folder on server
scp file.txt server:/tmp
# Copy *.html files from server to the local /tmp folder.
scp server:/var/www/*.html /tmp
# Copy all files and directories recursively from server to the current system's /tmp folder.
scp -r server:/var/www /tmp
# Synchronize /home to /backups/home
rsync -a /home /backups/
# Synchronize files/directories between the local and remote system with compression enabled
rsync -avz /home server:/backups/
#14 – DISK USAGE
# Show free and used space on mounted filesystems
df -h
df -i # Show free and used inodes on mounted filesystems
fdisk -l # Display disks partitions sizes and types
du -ah # Display disk usage for all files and directories in human readable format
du -sh # Display total disk usage off the current directory
#lang summary
sed - when you need to do simple text transforms on files.
awk - when you only need simple formatting and summarization or transformation of data.
perl - for almost any task, but especially when the task needs complex regular expressions.
python - for the same tasks that you could use Perl for.

#Flutter 
flutter create myapp
cd myapp
flutter devices
flutter run

#Clear Swap Space 
swapoff -a && swapon -a

#setup SDK
export PATH="$PATH:/home/jsavely/dart/dart-sdk/bin"
echo 'export PATH="$PATH:/home/jsavely/dart/dart-sdk/bin"' >> ~/.profile
source ~/.profile

#vim 
:%s/serchWord/ReplaceWord #serch and replace
:%s/serchWord/ReplaceWord/g #serch and replace globaly
tabedit nameOfTheFile.txt #open in a new tab 
:e %:h/myFileName #create new file from vim command line


