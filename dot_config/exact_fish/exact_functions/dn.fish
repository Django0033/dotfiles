function dn
    set current (path basename $PWD)
    set next (math $current + 1)

    if string match -qr '[0-9]+$' -- $current
        mkdir -p $next; and cd $next; and rpg ls
    else if test -d 1
        cd 1; and rpg ls
    else
        mkdir -p dungeon/1; and cd dungeon/1; and rpg ls
    end
end
