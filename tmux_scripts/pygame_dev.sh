#!/bin/bash

SESSION_NAME="pygameDev"
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
	cd /home/siggisv/work/projects/pygame-dev/pygame
	tmux new-session -s $SESSION_NAME -n "build/test" -d
	tmux set -g default-terminal "tmux-256color"
	tmux set -g status-left-length 16
	tmux set -g status-left "|#[bg=yellow]#S#[default]| "
	tmux set -g status-justify centre
	tmux send-keys ". ../venv-pygame/bin/activate" C-m
	tmux send-keys clear C-m
	tmux split-window -h
	tmux send-keys ". ../venv-linting/bin/activate;clear" C-m
	tmux send-keys C-m
	tmux send-keys "echo \"python setup.py docs\"" C-m
	tmux split-window -v
	tmux send-keys ". ../venv-pygame/bin/activate;clear" C-m
	tmux send-keys C-m
	tmux send-keys "echo \"python setup.py build -j2 --debug install\"" C-m
	tmux setw pane-border-status top
	tmux select-pane -t @0.0 -T "Testing"
	tmux select-pane -t @0.1 -T "Linting'n'document building"
	tmux select-pane -t @0.2 -T "Build"
	
	tmux new-window -n "vim(tests)" -t 1
	tmux send-key "vim test" C-m
	
	tmux new-window -n "vim(main)" -t 2
	tmux send-key "vim ." C-m
	
	tmux new-window -n "git" -t 9
	tmux send-key "git status" C-m
	tmux split-window -h
	tmux send-key "git hist --all" C-m
	tmux split-window -v
	tmux send-key "git hist --all" C-m
	
	tmux new-window -n "grep" -t 8
	tmux send-key "grep -rn -B5 -A5 --color=always \"Hello\" src_py | less -R" C-m
	tmux split-window -h

	tmux select-window -t @0

fi

tmux attach -t $SESSION_NAME
