#!/bin/bash

SESSION_NAME="pygameDev"
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
	cd /home/siggisv/work/projects/pygame-dev/pygame
	tmux new-session -s $SESSION_NAME -n "build/test" -d
	tmux set -g default-terminal "tmux-256color"
	tmux select-window -t $SESSION_NAME:0

	tmux set status-left-length 16
	tmux set status-left "|#[bg=yellow]#S#[default]| "
	tmux set status-justify centre

	tmux select-pane -t $SESSION_NAME:0.0 -T "Testing"
	tmux send-keys ". ../venv-pygame/bin/activate" C-m "clear" C-m

	tmux split-window -h
	tmux select-pane -t $SESSION_NAME:0.1 -T "Linting'n'document building"
	tmux send-keys ". ../venv-linting/bin/activate" C-m "clear" C-m
	tmux send-keys "python setup.py docs"

	tmux split-window -v
	tmux select-pane -t $SESSION_NAME:0.2 -T "Build"
	tmux send-keys ". ../venv-pygame/bin/activate" C-m "clear" C-m
	tmux send-keys "python setup.py build -j2 --debug install"

	tmux setw pane-border-status top

	tmux new-window -n "vim(tests)" -t $SESSION_NAME:1
	tmux send-key "vim test"

	tmux new-window -n "vim(main)" -t $SESSION_NAME:2
	tmux send-key "vim ." C-m

	tmux new-window -n "git" -t $SESSION_NAME:9
	tmux send-key "git status" C-m
	tmux split-window -h
	tmux send-key "git hist --all" C-m
	tmux split-window -v
	tmux send-key "git hist --all" C-m

	tmux new-window -n "grep" -t $SESSION_NAME:8
	tmux send-key "grep -rn -B5 -A5 --color=always \"Hello\" src_py | less -R" C-m
	tmux split-window -h
fi

tmux attach -t $SESSION_NAME:0.0
