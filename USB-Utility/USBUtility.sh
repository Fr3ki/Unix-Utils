#!/usr/bin/env

#Simple function to make a devider between elements
function devider() { echo "----------------------------------------------------------"
}

clear

#Warning
echo "WARNING: Improper use of this tool can result in loss of data, consult Readme for questions."

devider

#Storing input as a variable "TOOL"
read -p "Select a tool [ Flash | Format | Wipe | Quit ]: " TOOL


#Bootable USB tool
if [ ${TOOL,,} == "flash" ] || [ ${TOOL,,} == "f" ]
then
	clear
  echo "  
___  ____ ____ ___ ____ ___  _    ____    _  _ ____ ___  _ ____    ____ ____ ____ ____ ___ _ ____ _  _    ___ ____ ____ _    
|__] |  | |  |  |  |__| |__] |    |___    |\/| |___ |  \ | |__|    |    |__/ |___ |__|  |  | |  | |\ |     |  |  | |  | |    
|__] |__| |__|  |  |  | |__] |___ |___    |  | |___ |__/ | |  |    |___ |  \ |___ |  |  |  | |__| | \|     |  |__| |__| |___ 
                                                                                                                             
"
	#Change directory to home and then to your Downloads/ISO folder
	cd ~/
	cd Downloads/ISO
	
	#List all files in a single line
	devider
	ls -1
	devider

	#Store selection in var "ISO"
	read -p "Copy & paste an option: " ISO
	clear
	
	#Athstetic loading screen
	echo "GRABBING FILE..."
	devider
	sleep 1s
	
	#List drives
	lsblk
	devider
	
	#Take drive selection and store it in var "DRIVE"
	read -p "Select drive [WARNING DO NOT CHOSE YOUR BOOT DRIVE] : " DRIVE 
	clear
	
	#Warning #2
	echo "DO NOT CLOSE YOUR TERMINAL THIS NORMALLY TAKES A WHILE"
	
	#Take "DRIVE" and flash "ISO" once finished 
	sudo dd if=$ISO of=/dev/$DRIVE &

	sleep 15s
	
	#A loop to let the user know the tool is working
	while ps all | grep -q "[d]d"; do
		clear && echo "Flashing Drive..."
		sleep 3s
		clear && echo "Working..."
		sleep 3s
	done

	clear && echo "Drive flashed successfully"


#Media Formatting tool
elif [ ${TOOL,,} == "format" ] || [ ${TOOL,,} == "fm" ] 
then
	clear
	echo " 
_  _ ____ ___  _ ____    ____ ____ ____ _  _ ____ ___ ___ _ _  _ ____    ___ ____ ____ _    
|\/| |___ |  \ | |__|    |___ |  | |__/ |\/| |__|  |   |  | |\ | | __     |  |  | |  | |    
|  | |___ |__/ | |  |    |    |__| |  \ |  | |  |  |   |  | | \| |__]     |  |__| |__| |___ 

"
	#Warning
	devider
	echo "WARNING: This tool is still a work in progress, use at your own risk!"
	devider
	
	#List Drives
	lsblk
 	devider
	
	#Save drive selection in var "SELECTION"
	read -p "Select drive [WARNING DO NOT CHOOSE YOUR BOOT DRIVE] : " SELECTION
	clear
	
	#Warning
	echo "WARNING THIS WILL ERASE DRIVE TO QUIT: Ctrl + C"
	sleep 2s
	devider
	echo "Formats: EXT4, VFAT, NTFS"
	devider
	read -p "Select a format: " FORMAT

	#Check whether the disk is using gpt or dos
	TYPE="$(sudo fdisk -l /dev/$SELECTION | grep "Disklabel type" | awk '{print $3}')"

	#Formatting
	sudo wipefs -a -t $TYPE -f /dev/$SELECTION
	echo -e "n\np\n1\n\n\nw" | sudo fdisk /dev/$SELECTION && sudo mkfs.$FORMAT /dev/$SELECTION\1
	
	#Done message
	clear && echo "Done! You may now use your device."


#Media Destruction Tool
elif [ ${TOOL,,} == "wipe" ] || [ ${TOOL,,} == "w" ]
then
	clear && echo " 
_  _ ____ ___  _ ____    ___  ____ ____ ___ ____ _  _ ____ ___ _ ____ _  _    ___ ____ ____ _
|\/| |___ |  \ | |__|    |  \ |___ [__   |  |__/ |  | |     |  | |  | |\ |     |  |  | |  | |
|  | |___ |__/ | |  |    |__/ |___ ___]  |  |  \ |__| |___  |  | |__| | \|     |  |__| |__| |___

"
	#Bad idea man
	echo "!-!-!-DO NOT SELECT YOUR BOOT DRIVE-!-!-!"
	devider
	
	#List available drives
	lsblk
	devider
	
	#Select the drive to wipe
	read -p "Select a device: " SELECTION

	#Kaboom
	shred /dev/$SELECTION

	#Just a little loop to let the user know the tool is working
	while ps all | grep -q "[s]hred"; do
		clear && echo "Securely destroying data..."
		sleep 3s
		clear && echo "Wiping..."
		sleep 3s
	done && echo "Data has been securely destroyed, re-run the tool if extra assurance is needed"


elif [ ${TOOL,,} == "quit" ] || [ ${TOOL,,} == "q" ]
then
	exit
	
else
	clear
	echo "Error: Select a valid tool."
	sleep 1
	exec bash $0
fi
