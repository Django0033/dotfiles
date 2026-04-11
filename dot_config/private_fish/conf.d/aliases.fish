# Replace ls with eza
if type -q eza
    alias ls 'eza --icons --color=auto --group-directories-first'
    alias ll 'eza -l --color=auto --group-directories-first'
    alias la 'eza -a --icons --color=auto --group-directories-first'
    alias lla 'eza -la --color=auto --group-directories-first'
else
    alias ls 'ls --color=auto --group-directories-first'
    alias ll 'ls -l --color=auto --group-directories-first'
    alias la 'ls -a --color=auto --group-directories-first'
    alias lla 'ls -la --color=auto --group-directories-first'
end

# Replace cd with zoxide
if type -q zoxide
    function cd
        z $argv && la && rpg-cli cd (pwd) && rpg-cli ls
    end

    alias cdi 'zi'
end

#get fastest mirrors in your neighborhood
alias mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord "sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors "sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora "sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"

# RPG-CLI
alias rpg "rpg-cli"
alias rpg-battle "rpg-cli cd -f . && rpg-cli battle"
# alias touch "rpg-battle && touch"

alias icat "kitty +kitten icat"
