target_dir=/etc/fonts/conf.avail
custom_config_dir=./etc/fonts/conf.avail

choice=0

# [*** WARNING: This script does some actions that require superuser permission. Do not proceed if you do not know what you are going to do. ***]


if [ "$(whoami)" != "root" ]
then
	echo -e "\nThis utility enables you to apply/reset custom CJK font display settings\n"	
	echo "ERROR: This script does some actions that require superuser permission
		Start with \"sudo `pwd`/`basename $0`\" to try again				
		You may be asked to provide your root password when necessary"
	exit 1
fi

while [ "$choice" != "X" ] && [ "$choice" != "x" ]; do
	echo -e "\nThis utility enables you to apply/reset custom CJK font display settings\n"
	echo -e "[*** WARNING: This script does some actions that require superuser permission. Do not proceed if you do not know what you are going to do. ***]\n"
	
	echo "What are you going to do now?"
	echo "[A] Apply custom settings"
	echo "[R] Reset to system default settings"
	echo "[C] Check the current CJK font listings in $target_dir"
	echo "[X] Exit"
	read -p "Enter your choice > " choice
	
	case $choice in
		
		[Aa]) # Apply custom settings
			echo -e "\nApply custom settings...\n"
			
			cp -v $custom_config_dir/*.* -t $target_dir
			
			echo -e "\nDONE\n"
			echo -e "\nPlease log out and log in again to see the font changes\n"
			;;
			
		[Rr]) # Reset to system default settings
			echo -e "\nReset to system default settings...\n"
			
			while read -r bak
			do
				orig=${bak%.bak}
				echo $orig
				mv -v $target_dir/$bak $target_dir/$orig
			done < backup_file_list.txt
			
			echo -e "\nDONE\n"
			echo -e "\nPlease log out and log in again to see the font changes\n"
			;;
			
		[Cc]) # Check the current listings in $target_dir
			echo -e "\nListing CJK config files in $target_dir\n"
		
			while read -r bak
			do
				orig=${bak%.bak}
				ls $target_dir/$orig 2>/dev/null
				ls $target_dir/$bak 2>/dev/null
			done < backup_file_list.txt
			
			echo -e "\nNote: If you see files ending in *.bak, it means that backup files are created, and the custom settings are applied.\n"
			;;
			
		[Xx]) # EXIT
			;;
			
		*) # DEFAULT
			echo -e "\nINVALID CHOICE\n"
			;;
			
	esac
	
	
done

