# Start X at login
if status is-login
   if test -z "$DISPLAY" -a $XDG_VTNR = 1
       exec startx -- -keeptty
   end
end

# powerline-daemon -q
# set POWERLINE_BASH_CONTINUATION 1
# set POWERLINE_BASH_SELECT 1
#
# set fish_function_path $fish_function_path "/home/marc-olivier/.local/lib/python3.6/site-packages/powerline/bindings/fish/"
# powerline-setup
set fish_greeting ""

function cs
   cd $argv
   ls 
end

alias s="sudo"
function s
    sudo $argv
end

alias v="vim"
function v
    vim $argv
end

# set fish_color_autosuggestion --foreground=grey
set fish_color_autosuggestion 586e75

tmux source-file ~/.tmux.conf

source /home/marc-olivier/.config/fish/lol.fish
