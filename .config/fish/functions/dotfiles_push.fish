function dotfiles_push
    config add -u
    and config commit -m "Update (date '+%Y-%m-%d %H:%M') (uname -s)/(uname -m)-(hostname -s)"
    and config push
end
