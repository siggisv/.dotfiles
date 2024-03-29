#!/bin/bash

usage() {
	echo "Usage:"
	echo " $0 [-h|--help] [-c|--col|--columns <num>]"
	echo "        [-l|--lines <num>] [-n|--no-resize] [--] [<session name>]"
}

help() {
	usage
	echo
	echo "Set up tmux like I want it for C++ development."
	echo "(Note, remember to enter the correct directory before running"
	echo "this script)"
	echo
	echo "Options:"
	echo " -c, --col,"
	echo "     --columns <num>  number of columns to resize the terminal to"
	echo " -l, --lines <num>    number of lines to resize the terminal to"
	echo " -n, --no-resize      disable resizing of the terminal"
	echo
	echo " -h, --help           display this help"
	echo
	echo "Unless resizing is disabled, it will try resizing the terminal,"
	echo "with default values for resizing being 87 lines and 171 columns."
	echo "It stores the original size of the terminal and will try resetting"
	echo "its size back after exiting tmux."
	echo
	echo "Optionally provide a name for the tmux session. Quote marks are not"
	echo "necessary for names with whitespace but names with special symbols"
	echo "(e.g. '|' or '>') need to be within quote marks. For names starting"
	echo "with '-', add '-- ' in front of it."
	echo
	echo "If not specified, the default session name is \"C++ dev\"."
}

# default values
SESSION_NAME="C++ dev"
NEW_LINES=87
NEW_COLUMNS=173
DO_RESIZE=1

VALID_ARGS=$(getopt -q -o hc:l:n \
		--long help,col:,columns:,lines:,no-resize -- "$@")
ERR_CODE=$?
if [[ $ERR_CODE -ne 0 ]]; then
	if [[ $ERR_CODE -eq 1 ]]; then
		echo -e "Invalid command option: $1"
		usage
		echo "See $0 --help for more details."
	else
		echo -e "getopt failed! Return code: $ERR_CODE"
	fi
	exit $?
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
	case "$1" in
		-c | --col | --columns)
			NEW_COLUMNS=$2
			shift 2
			;;
		-l | --lines)
			NEW_LINES=$2
			shift 2
			;;
		-n | --no-resize)
			DO_RESIZE=0
			shift
			;;
		-h | --help)
			help
			exit 0
			;;
		--) shift;
			break
			;;
	esac
done

if [[ $# -ge 1 ]]; then
	SESSION_NAME=$@
fi

if [[ $DO_RESIZE -ne 0 ]]; then
	source <(/usr/bin/resize -s)
	OLD_LINES=$LINES
	OLD_COLUMNS=$COLUMNS
	/usr/bin/resize -s $NEW_LINES $NEW_COLUMNS > /dev/null
fi

tmux has-session -t "$SESSION_NAME" 2>/dev/null
if [ $? != 0 ]; then
	set -- $(stty size) # $1 = rows $2 = columns
	tmux new-session -s "$SESSION_NAME" -x "$2" -y "$(($1 - 1))"\
		-n "cmake/git" -d
	tmux select-window -t "$SESSION_NAME:0"
	tmux send-keys "git hist --all" C-m

	tmux split-window -h
	tmux send-keys "nvim CMakeLists.txt" C-m

	tmux split-window -vf -l 14
	# The following add often used commands to the history.
	# Echo temporarily set off to make it look cleaner.
	tmux send-keys "  stty -echo" C-m\
		"history -s cmake -S . -B Debug -DCMAKE_BUILD_TYPE=Debug" C-m\
		"history -s cmake -S . -B Release -DCMAKE_BUILD_TYPE=Release" C-m\
		"history -s cmake --build Debug" C-m\
		"history -s Debug/hello_sample" C-m\
		"  clear" C-m\
		"  stty echo" C-m

	tmux new-window -n "SRC" -t "$SESSION_NAME:1"
	tmux split-window -v -l 14
	tmux send-keys "  stty -echo" C-m\
		"history -s cpplint --recursive src include" C-m\
		"history -s clang-format -i src/*.[hc]pp "\
			"include/*/*.hpp --dry-run" C-m\
		"history -s clang-format -i src/*.[hc]pp "\
			"include/*/*.hpp" C-m\
		"  clear" C-m\
		"  stty echo" C-m
	tmux select-pane -t :.0
	tmux resize-pane -Z
	tmux send-keys "nvim src" C-m

	tmux new-window -n "g/re/p" -t "$SESSION_NAME:2"
	tmux split-window -h
	tmux send-keys "grep -rn -B5 -A5 --color=always \"filesystem\" "\
		"include src | less -R" C-m
fi

tmux attach -t "$SESSION_NAME:0.0"
if [[ $DO_RESIZE -ne 0 ]]; then
	/usr/bin/resize -s $OLD_LINES $OLD_COLUMNS > /dev/null
	echo
fi
