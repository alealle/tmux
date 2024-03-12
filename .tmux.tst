# Enable vi keys.
setw -g mode-keys vi

# Escape turns on copy mode
bind Escape copy-mode

# v in copy mode starts making selection
bind-key -T copy-mode v send -X begin-selection
bind-key -T copy-mode y send -X copy-selection

# make Prefix p paste the buffer.
unbind p
bind p paste-buffer

# Send prefix
set-option -g prefix C-a
unbind-key C-a
bind-key C-a send-prefix
 
# Use Alt-arrow keys to switch panes
bind -n C-S-Left select-pane -L
bind -n C-S-Right select-pane -R
bind -n C-S-Up select-pane -U
bind -n C-S-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left previous-window
bind -n S-Right next-window
 
# Set easier window split keys
bind-key v split-window -h
bind-key h split-window -v
 
# don't rename windows automatically
set-option -g allow-rename off

# if it is a part of a function or meta key sequences. The default is 500 milliseconds.
set -s escape-time 0

# Set status bar on
set -g status on

# Update the status line every second
set -g status-interval 1

# Set the position of window lists.
set -g status-justify left # [left | centre | right]

# Set Vi style keybinding in the status line
set -g status-keys vi

# Set the status bar position
set -g status-position top # [top, bottom]

# Set status bar background and foreground color.
#set -g status-style fg=colour136,bg="#002b36"

#set -g @colors-solarized 'dark'
# Set left side status bar length and style
set -g status-left-length 120
set -g status-left-style default

# Display the session name
set -g status-left "#[fg=green] ❐ #S #[default]"

# Display the os version (Mac Os)
set -ag status-left " #[fg=black] #[fg=green,bright]  #(sw_vers -productVersion) #[default]"

# Display the battery percentage (Mac OS)
set -ag status-left "#[fg=green,bg=default,bright] 🔋 #(pmset -g batt | tail -1 | awk '{print $3}' | tr -d ';') #[default]"

# Set right side status bar length and style
set -g status-right-length 180
set -g status-right-style default
# Display the weather
# Display the cpu load (Mac OS)
set -g status-right "#[fg=darkgray,bg=default]🕸 #{network_bandwidth}"
set -ag status-right "  #(top -l 1 | grep -E "^CPU" | sed 's/.*://') #[default]"
set -ag status-right "#{weather}"
# Display the time
#set -ag status-right "#[fg=colour172,bright,bg=default] ⌚︎%l:%M %p #[default]"

# Display the hostname
# set -ag status-right "#[fg=cyan,bg=default] ☺  #H #[default]"

# Set the inactive window color and style
#set -g window-status-style fg=colour244,bg=default
#set -g window-status-format ' #I #W '

# Set the active window color and style
#set -g window-status-current-style fg=black,bg=colour136
#set -g window-status-current-format ' #I #W '

# Colors for pane borders(default)
#setw -g pane-border-style fg=green,bg=black
#setw -g pane-active-border-style fg=white,bg=black

# Active pane normal, other shaded out
#setw -g window-style fg=colour240,bg=colour235
#setw -g window-active-style fg=white,bg=black

# Set a larger scroll back
set-option -g history-limit 100000

# A quiter setup
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none

# Easy config reload
bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded."

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'xamut/tmux-network-bandwidth'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'timtorchen/tmux-weather'
set -g @plugin 'seebi/tmux-colors-solarized'
#set -g @plugin 'aaronpowell/tmux-weather'
# Other examples:
# set -g @plugin 'github_username/plugin_name'

# load plugins - should not be necessary if we have tpm installed
run '~/.tmux/plugins/tpm/tpm'

# Mouse mode
set -g mouse on

# weather
# use ip to get location by default
set-option -g @tmux-weather-location "Sao Paulo"

# set "c" for Celsius, and "f" for Fahrenheit.
# default units is "c"
set-option -g @tmux-weather-units "c"
