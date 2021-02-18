#!/bin/bash
##PLEASE READ README.MD BEFORE USE
clear
echo "WARNING PLEASE CONSULT README.MD BEFORE USE"
read -p "Chose Functionality [ Flash | Restore ]: " TOOL

function devider() {
	echo "----------------------------------------------------------"
}
if [ $TOOL == "Flash" ]
then
	clear
	echo "  
  ___           _        _    _       __  __        _ _         ___              _   _            _____         _ 
 | _ ) ___  ___| |_ __ _| |__| |___  |  \/  |___ __| (_)__ _   / __|_ _ ___ __ _| |_(_)___ _ _   |_   _|__  ___| |
 | _ \/ _ \/ _ \  _/ _  |  _ \ / -_) | |\/| / -_) _  | / _  | | (__|  _/ -_) _  |  _| / _ \   \    | |/ _ \/ _ \ |
 |___/\___/\___/\__\__,_|_.__/_\___| |_|  |_\___\__,_|_\__,_|  \___|_| \___\__,_|\__|_\___/_||_|   |_|\___/\___/_|
                                                                                                                  "
	#read -p "Enter the directory of your file: " PATH
 	cd ~/
	cd Downloads/ISO
	#cd /$PATH
	devider
	ls -1
	devider
	read -p "Copy & paste an option: " ISO
	clear
	echo "GRABBING FILE..."
	devider
	sleep 1s
	lsblk
	devider
	read -p "Select drive [WARNING DO NOT CHOSE YOUR BOOT DRIVE] : " DRIVE 
	clear
	echo "DO NOT CLOSE TERMINAL THIS NORMALLY TAKES A WHILE"
	sudo dd if=$ISO of=/dev/$DRIVE && clear &&  echo "Done! You may now close your cli."

elif [ $TOOL == "Restore" ]
then
	clear
	echo " 

  __  __        _ _        ___        _                _   _            _____         _ 
 |  \/  |___ __| (_)__ _  | _ \___ __| |_ ___ _ _ __ _| |_(_)___ _ _   |_   _|__  ___| |
 | |\/| / -_) _  | / _  | |   / -_|_-<  _/ _ \ '_/ _  |  _| / _ \   \    | |/ _ \/ _ \ |
 |_|  |_\___\__,_|_\__,_| |_|_\___/__/\__\___/_| \__,_|\__|_\___/_||_|   |_|\___/\___/_| 
 "
	lsblk
 	devider
	read -p "Select drive [WARNING DO NOT CHOOSE YOUR BOOT DRIVE] : " SELECTION
	clear
	echo "WARNING THIS WILL ERASE DRIVE TO QUIT: Ctrl + C"
	sleep 2s
	echo "Select gpt label and create a new partiton, then write and quit"
	sleep 10s
	sudo mkfs.ext4 /dev/$SELECTION && sudo cfdisk /dev/$SELECTION
	echo "Done! You may now use your device."
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
                                                                                        


