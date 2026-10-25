## Useful aliases
# Replace ls with eza
if type -q eza
    alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
    alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
    alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
    alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
    alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles
else
    alias ls 'ls --color=auto --group-directories-first'
    alias ll 'ls -l --color=auto --group-directories-first'
    alias la 'ls -a --color=auto --group-directories-first'
    alias lla 'ls -la --color=auto --group-directories-first'
end

# Replace cd with zoxide
if type -q zoxide
    # function cd
        # z $argv && la && rpg-cli cd -f (pwd) && rpg-cli battle && rpg-cli ls
        # z $argv && la
    # end

    alias cdi 'zi'
end

# Common use
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages
alias update='sudo pacman -Syu'

# Get fastest mirrors
alias mirror="sudo cachyos-rate-mirrors"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# RPG-CLI
if type -q rpg-cli
    alias rpg "rpg-cli"
    alias rpg-battle "rpg-cli cd -f . && rpg-cli battle"

    if type -q zoxide
        function cd
            z $argv && la && rpg-battle && rpg ls
        end
    else
        function cd
            builtin cd $argv && la && rpg-battle && rpg ls
        end
    end

    # alias rm="rpg-battle &; rm"
    # alias rmdir="rpg-battle &; rmdir"
    # alias mkdir="rpg-battle &; mkdir"
    # alias touch="rpg-battle &; touch"
    # alias mv="rpg-battle &; mv"
    # alias cp="rpg-battle &; cp"
    # alias chown="rpg-battle &; chown"
    # alias chmod="rpg-battle &; chmod"
end

alias android-studio '_JAVA_OPTIONS="-Dawt.toolkit.name=WLToolkit -Dsun.java2d.metal=false" setid /opt/android-studio/bin/studio.sh &; disown'
