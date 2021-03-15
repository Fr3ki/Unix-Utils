Bootable Media Creation Tool by Fr3ki



This is a semi-graphical cli tool for intermediate users to flash bootable media, or restore disk to ext4 storage device.

___________________________________________________________________________________________________________________
Warning: Using this on the wrong drive will wipe your system. You have been warned, I am not liable for any damages caused by mishaps or missuse. 
___________________________________________________________________________________________________________________
Choosing the right drive: Simple, just look for the drive which has a storage space value displayed that is closest to or equal to the drive you were looking to flash. Be careful if you are flashing drives which have the same amount of storage as your system drive. Your system drive is many times /dev/sda/ so avoid flashing media to that unless absoutely sure its what you are looking for. 
Tip two, run the tool, then unplug and run again. Whichever drive is missing is the drive you want to flash. Re-plug your media and flash.
___________________________________________________________________________________________________________________
Warning: This script assumes you keep your ISO files in a folder ~/Downloads/ISO if this is not the case either: 
1) Create the folder Downloads/ISO and move respective files there.
2) Change the line "cd ~/Downloads/ISO" to "cd ~/path/Your ISO folder here/"
	 ~ denotes your home folder
____________________________________________________________________________________________________________________

Thank you for using, and please leave any suggestions or feedback in a github comment or on my website [COMMING SOON] 

If you would like to support me and my work, which will always be free and open source, check the finance.yml, never required, but always appreciated!
