#!/bin/bash

SESSION_NAME="remoTemo-dev"
source <(/usr/bin/resize -s)
OLD_LINES=$LINES
OLD_COLUMNS=$COLUMNS
/usr/bin/resize -s 87 173 > /dev/null

tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
	cd ~/work/projects/remotemo/remotemo
	set -- $(stty size) # $1 = rows $2 = columns
	tmux new-session -s "$SESSION_NAME" -x "$2" -y "$(($1 - 1))"\
		-n "cmake/git" -d
	tmux select-window -t "$SESSION_NAME:0"
	tmux send-keys "git hist --all" C-m

	tmux split-window -h
	tmux send-keys "nvim CMakeLists.txt" C-m

	tmux split-window -vf -l 14
	tmux send-keys "  stty -echo" C-m\
		"history -s cmake -S . -B Debug -DCMAKE_BUILD_TYPE=Debug" C-m\
		"history -s cmake -S . -B Release -DCMAKE_BUILD_TYPE=Release" C-m\
		"history -s cmake --build Debug" C-m\
		"history -s Tools/run_tests" C-m\
		"history -s Debug/tests/test_io [print] -s" C-m\
		"history -s cmake --build Debug --target docs 2>&1 "\
			"| grep --color=always \"warning\" | less -R" C-m\
		"  clear" C-m\
		"  stty echo" C-m

	tmux new-window -n "SRC" -t "$SESSION_NAME:1"
	tmux split-window -v -l 14
	tmux send-keys "  stty -echo" C-m\
		"history -s cpplint --recursive src samples include tests/src" C-m\
		"history -s 'clang-format -i src/*.[hc]pp tests/src/*.[hc]pp "\
			"samples/*.[hc]pp include/*/*.hpp --dry-run'" C-m\
		"history -s Tools/diff-clang-format src/remotemo.cpp" C-m\
		"  clear" C-m\
		"  stty echo" C-m
	tmux select-pane -t :.0
	tmux resize-pane -Z
	tmux send-keys "nvim src" C-m

	tmux new-window -n "g/re/p" -t "$SESSION_NAME:2"
	tmux split-window -h
	tmux send-keys "grep -rn -B5 -A5 --color=always \"filesystem\" "\
		"include src tests/src | less -R" C-m
fi

tmux attach -t "$SESSION_NAME:0.0"
/usr/bin/resize -s $OLD_LINES $OLD_COLUMNS > /dev/null
echo
