#!/bin/bash
#Simple function to make a devider between elements
function devider() {

        echo "----------------------------------------------------------"

}

clear

#Warning

echo "WARNING: PLEASE CONSULT README.MD BEFORE USE"

devider

#Disclaimer

echo "WARNING: Restore tool is not working completley as intended, use at your own risk"

#Storing input as a variable "TOOL"

read -p "Chose Functionality [ Flash | Restore ]: " TOOL

#Bootable USB tool

if [ $TOOL == "Flash" ]
then
	clear
	echo "  
  ___           _        _    _       __  __        _ _         ___              _   _            _____         _ 
 | _ ) ___  ___| |_ __ _| |__| |___  |  \/  |___ __| (_)__ _   / __|_ _ ___ __ _| |_(_)___ _ _   |_   _|__  ___| |
 | _ \/ _ \/ _ \  _/ _  |  _ \ / -_) | |\/| / -_) _  | / _  | | (__|  _/ -_) _  |  _| / _ \   \    | |/ _ \/ _ \ |
 |___/\___/\___/\__\__,_|_.__/_\___| |_|  |_\___\__,_|_\__,_|  \___|_| \___\__,_|\__|_\___/_||_|   |_|\___/\___/_|"
 	
	#Change directory to home and then to your Downloads/ISO folder
	
	cd ~/
	cd Downloads/ISO
	
	
	devider
	
	#List all files in a single line
	
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
	
	echo "DO NOT CLOSE TERMINAL THIS NORMALLY TAKES A WHILE"
	
	#Take "DRIVE" and flash "ISO" once finished 
	
	sudo dd if=$ISO of=/dev/$DRIVE && clear &&  echo "Done! You may now close your cli."

#Media Restoration tool

elif [ $TOOL == "Restore" ]
then
	clear
	echo " 

  __  __        _ _        ___        _                _   _            _____         _ 
 |  \/  |___ __| (_)__ _  | _ \___ __| |_ ___ _ _ __ _| |_(_)___ _ _   |_   _|__  ___| |
 | |\/| / -_) _  | / _  | |   / -_|_-<  _/ _ \ '_/ _  |  _| / _ \   \    | |/ _ \/ _ \ |
 |_|  |_\___\__,_|_\__,_| |_|_\___/__/\__\___/_| \__,_|\__|_\___/_||_|   |_|\___/\___/_| "
	
	#List Drives
	
	lsblk
 	devider
	
	#Save drive selection in var "SELECTION"
	
	read -p "Select drive [WARNING DO NOT CHOOSE YOUR BOOT DRIVE] : " SELECTION
	clear
	
	#Warning
	echo "WARNING THIS WILL ERASE DRIVE TO QUIT: Ctrl + C"
	sleep 2s
	
	#Instructions
	
	echo "Select gpt label and create a new partiton, then write and quit"
	sleep 10s
	
	#Restoration
	sudo mkfs.ext4 /dev/$SELECTION && sudo cfdisk /dev/$SELECTION
	#Done message
	echo "Done! You may now use your device."


##Usage tool UNDER CONSTRUCTION
#elif [ $TOOL == "Usage" ]
#then
#	clear
#	devider
#	cd /
#	ls
#	devider
#	read -p "Select path or drive: " SELECTION
#	du -h $SELECTION/
else
	clear
	echo "Error: Select a valid tool."
	sleep 1
	exec bash $0
fi
                                                                                        


