alias nvim-test="env NVIM_APPNAME=nvim-test nvim"
alias nvim-kick="env NVIM_APPNAME=nvim-kick nvim"
alias nvim-kickstart="env NVIM_APPNAME=nvim-kickstart nvim"

function nvims
    # Definimos el arreglo de opciones (en Fish no se usan paréntesis)
    set items "default" "nvim-test" "nvim-kick" "nvim-kickstart"
    # Usamos printf para pasar los items a fzf
    # En Fish, (comando) ejecuta y captura la salida
    set config (printf "%s\n" $items | fzf --prompt="Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)

    # Estructura condicional de Fish (usa 'test' en lugar de '[[]]')
    if test -z "$config"
        echo "Nothing selected"
        return 0
    else if test "$config" = "default"
        set config ""
    end

    # Ejecutamos nvim con la variable de entorno y pasamos los argumentos ($argv)
    env NVIM_APPNAME="$config" nvim $argv
end
