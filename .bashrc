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
	read -e -p "Command to run: " cmd
	eval "nohup $cmd & disown"
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

mtasks()
{
	echo "Options:"
	echo ""
	echo "1) Music"
	echo "2) List files with index"
	echo "3) Update"
	echo ""
	read -p "Enter d'aul option: " opt

	case $opt in
		"1")
				mmusic
				;;
		"2")
				mls
				;;
		"3")
				mupdate
				;;
		*)
			echo "Invalid option!"
			;;
	esac
}
#tmux
