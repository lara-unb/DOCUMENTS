# DOCUMENTS
This repository folder contains useful scripts for all users.
Please update the description of each program within this readme.md file. 

## lfcmd--ramFreeRam.sh
* Author: 	Luis F C Figueredo	
* Type: 	*Shell Script*
* Requirement:	*Linux (any)*
* Installation: Download the .sh file then copy it to /usr/local/sbin or /usr/local/bin. Check the permission (ls -la). Command to change the permission (needs execute perm.): chmod a+x lfcmd--ramFreeRam.sh
* Usage:		Command-line command (anywhere on bash) as root: 
		**$sudo lfcmd--ramFreeRam.sh**	
* INFO: 	**Move SWAP memory to RAM and free unused space from RAM on Linux**



## lfcmd--ubuntu-first-install-guide.sh
* Author: 	Luis F C Figueredo	
* Type: 	*Shell Script*
* Requirement:	*Linux (Ubuntu, mint, debian(untested))*
* Installation: Download the .sh file. In the same folder, check the permission (ls -la). Command to change the permission (needs execute perm.): chmod a+x lfcmd--ubuntu-first-install-guide.sh
* Usage 1):	Command-line command (in the same folder): 
		**$lfcmd--ubuntu-first-install-guide.sh**
* Usage 2):	Command-line command (in the same folder) as sudo:
		**$sudo lfcmd--ubuntu-first-install-guide.sh**
* INFO: 	**This script will ask you to install a series of linux apps that I believe to be important. Packages are clustered by type and WILL NOT be installed without your previous approval (during execution). When running this script without root permission (usage 1), the script will only check if the packages are already installed and compare the current version with the version available at your current linux repository.**

