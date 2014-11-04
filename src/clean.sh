#!/bin/bash
#Citation:
#Confirm script from Dennis Williamson
#http://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias
echo "Deleting all files...this is irreversible"


read -r -p "Are you sure? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
	g.mremove -f rast=* group=* 
        ;;
    *)
	echo "Exiting"; exit;
        ;;
esac
echo "Done."
