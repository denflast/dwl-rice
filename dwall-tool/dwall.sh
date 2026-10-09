#!/bin/sh
#var_check() {
#	if [[ -f $HOME/cdwall ]]; then
#       		source $HOME/cdwall
#	else
#		echo "No configuration file in $HOME/..."
#		exit 1
#	fi
#}
#-------* Config *-------#

WALL_DIR="$HOME/Wallpapers"

#-------* Script *-------#
check_config() {
	case $WALL_COM in
		"awww img"*|"swww img"*)
			echo Check
			;;
		"xwallpaper"*)
			echo Check
			;;
		*)
			echo -e "\033[31mERROR:\033[0m Not avaliable wallpaper set tool"
			exit 1
			;;
	esac
}

setwal() {
	selected=$(ls $WALL_DIR | dmenu)
	
	if [ -z $selected ]; then
		exit 0
	fi
	WALL_COM="awww img $WALL_DIR/$selected --transition-type grow --transition-fps 60"
	check_config
	$WALL_COM
}

help() {
	echo -e "\033[35mdwall\033[0m - small tool for setting wallpaper"
	echo -e "\033[35mFlags:\033[0m"
	echo -e "  \033[32m-i\033[0m	set wallpaper"
	echo -e "  \033[32m-w\033[0m	set wallpaper and generate palette with pywal"
	echo -e "  \033[32m-h\033[0m	show this help\n"
}


if [ -z $1 ]; then
	help
	exit
else
	case $1 in
	-i)
		#check_config
		setwal
		echo $selected
	;;
	-w)
		#check_config
		setwal
		wal -i $WALL_DIR/$selected -n
	;;
	-h)
		help
	;;
	*)
		echo "Incorrect flag"
		exit 1	
	;;
	esac
fi
