##  WARNING
Honestly I wrote this in highschool and it's really not great you should probably just use dd. Maybe I'll get back around to improving it someday.

# Bootable Media Creation Tool (USB Utility)
This is a semi-graphical cli tool for intermediate users to flash, format, or wipe a device.

# Usage
Warning: Using this on the wrong drive WILL WIPE YOUR SYSTEM! You have been warned, I am not liable for any damages caused by mishaps or missuse. 

Choosing the right drive: Simple, just look for the drive which has a storage space value displayed that is closest to or equal to the drive you were looking to flash. Be careful if you are flashing drives which have the same amount of storage as your system drive. Your system drive is many times /dev/sda/ so avoid flashing media to that unless absoutely sure its what you are looking for. 

Tip two, run the tool, then unplug and run again. Whichever drive is missing is the drive you want to flash. Re-plug your media and flash.

Warning: This script assumes you keep your ISO files in a directory ~/Downloads/ISO if this is not the case either: 
1) Create the directory Downloads/ISO and move respective files there.
2) Change the line "cd ~/Downloads/ISO" to "cd ~/path/Your ISO directory here/"
	 ~ denotes your home directory
