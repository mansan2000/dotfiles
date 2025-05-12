if status is-interactive
    # Commands to run in interactive sessions can go here
end


# my changes
# Open keyd config
function keydconf
    sudo vim /etc/keyd/default.conf
end

# Open i3 config
function i3conf
    vim ~/.config/i3/config
end

# Restart keyd
function keydrestart
    sudo systemctl restart keyd
end

# Reload i3 config
function i3reload
    i3-msg reload; and i3-msg restart
end

function config --description 'Git wrapper for dotfiles'
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
funcsave config

function dotfiles_push
    config add -u
    and config commit -m "Update (date '+%Y-%m-%d %H:%M') (uname -s)/(uname -m)-(hostname -s)"
    and config push
end
funcsave dotfiles_push

