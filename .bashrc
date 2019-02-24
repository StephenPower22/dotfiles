# Color definitions
Normal='\e[0m'
Red='\e[0;31m'

export PATH=$PATH:~/bin
#mbackpic

mgotowine()
{
	eval "cd ~/.wine/drive_c/Program\ Files"
}
mupdate()
{
	sudo apt-get update
	sudo apt-get upgrade
}

mwebsearch()
{
	ENGINE="duckduckgo.com"
	chromium-browser --app="http://$ENGINE?q=$1"
}

mbrowse()
{
	BROWSER=chromium-browser
	$BROWSER --app="http://$1"
}


mlaunch()
{
	#read -e -p "Command to run: " cmd
	#eval "nohup $cmd & disown"
	eval "nohup $1 & disown"
}

mshutdown()
{
	sudo shutdown -h now
}

mopen()
{
	file=$(ls -1)

	count=1
	for f in $file
	do
		if [ $count -eq $1 ]
		then
			xdg-open $f
		fi
		(( count++ ))
	done
}

mls()
{
	file=$(ls -1)

	count=1
	for f in $file
	do
		echo -e "$Red$count$Normal $f"
		(( count++ ))
	done

}

mfirstfile()
{
	echo "$(ls -1 | head -n1)"
}

mcputemp()
{
	temp=$(cat /sys/class/thermal/thermal_zone0/temp)
	echo "$temp"
}

msuspend()
{
	sudo pm-suspend; i3lock -c 005500 
	#sudo pm-suspend; 
}

mtrack()
{
	while true
	do
		echo "[$(date)] $($1)"
		sleep $2
	done
}

mnote() (
	notefile=~/notes/notes.txt
	seperator="################################################################################"

	case $1 in
		"search")
			grep -in "$2" $notefile
			;;
		"g"|"goto")
			vim -c "/\c$2" $notefile
			;;
		"e"|"edit")
			vim $notefile
			;;
		"p"|"prompt")
			read -p "Note: " note
			echo $seperator >> $notefile
			echo ""
			echo "$1" >> $notefile
			echo ""
			;;
		*)
			if [ "x$1" == "x" ]
			then
				cat $notefile
			else
				echo $seperator >> $notefile
				echo ""
				echo "$1" >> $notefile
				echo ""
			fi
			;;
	esac
)
#tmux
