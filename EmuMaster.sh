clear
#colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'
echo -e "$BLACK Black $RED Red $GREEN Green $BLUE Blue $RESET Normal"
function typewriter {

echo -e "$GREEN"



str=$1
text="$1"

length=$(echo -n $str | wc -m)
speed="0."$(expr $length / 2048)$(expr $length \* 2048)
echo "=========================================="
for i in $(seq 0 $(expr length "${text}")) ; do
    echo -n "${text:$i:1}"  
    sleep $speed
done
echo ""
echo "=========================================="


}
function GamePick {
clear
typewriter "EMU-Master, manages and controlls emulators of many kinds. Version 1.0. Please choose an emulator."
echo ""
clear
typewriter "Emulator list:"
echo -ne "$RED"
cat emulist
echo -ne "$GREEN"
typewriter "You may need to supply arguments for certan emulators, like the location of an ISO or .bin file. Just type the argument after the command."
printf "EMULATOR: "
read emulator 
echo "Executing $emulator... "
$emulator
echo "$emulator stopped!"
echo "Restarting in 2 seconds."
sleep 2
}

typewriter "Typewriter effect loaded. Returning variables..."
echo "Speed:" $speed
echo "Length:" $length
sleep 2
clear
typewriter "Loading emumaster..."
sudo apt-get update > /dev/null
sudo dpkg --add-architecture i386> /dev/null
clear
echo "10%"
sudo add-apt-repository 'deb http://www.deb-multimedia.org jessie main non-free' > /dev/null
sudo add-apt-repository 'deb http://http.debian.net/debian/ jessie-backports main contrib non-free' > /dev/null
sudo add-apt-repository deb-multimedia-keyring > /dev/null
cat /etc/apt/sources.list | awk '!a[$0]++' | sudo tee  /etc/apt/sources.list
clear
echo "20%"
sudo apt-get install -y dosbox> /dev/null
grep -q -F 'dosbox' emulist || echo 'dosbox' >> emulist
#dos simulator
clear
echo -en "\r45%"
sudo apt-get install -y stella > /dev/null
grep -q -F 'stella' emulist || echo 'stella' >> emulist
#stella, i think atari?
clear
echo -en "\r50%"
sudo apt-get install -y mednafen > /dev/null
grep -q -F 'mednafen' emulist || echo 'mednafen' >> emulist
#mednafen

echo -en "\r70%"
sudo apt-get install -y pcsxr > /dev/null
grep -q -F 'pcsxr' emulist || echo 'pcsxr' >> emulist
#ps1
clear
echo -en "\r80%"
sudo apt-get install -y pcsx2 pcsx2-dbg pcsx2-unstable python-wxgtk3.0 python-wxtools > /dev/null
#grep -q -F 'pcsx2' emulist || echo 'pcsx2' >> emulist
#ps2
clear
echo -en "\r90%"
sudo apt-get install -y pv > /dev/null
clear
echo -en "\r100%"
echo ""
echo "Finished."
#dependancies for script
sleep 2
typewriter "Loading finshed. Starting..."
clear

while true; do
GamePick
done
exit 0