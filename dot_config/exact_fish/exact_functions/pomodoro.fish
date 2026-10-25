function pomodoro --description 'Pomodoro timer: [-f work_min] [-b break_min] [-n sessions]'
    function countdown
        set -l total $argv[1]
        set -l remaining $total
        while test $remaining -gt 0
            printf '\r%02d:%02d remaining ' (math "floor($remaining / 60)") (math $remaining % 60)
            sleep 1
            set remaining (math $remaining - 1)
        end
        printf '\r%02d:%02d \n' 0 0
    end

    function notify
        printf '\a'
        switch (uname)
        case Linux
            notify-send "Pomodoro" $argv
        case Darwin
            osascript -e "display notification \"$argv\" with title \"Pomodoro\""
        case '*'
            echo "Ding! $argv"
        end
    end

    argparse 'f/work=' 'b/break=' 'n/sessions=' -- $argv
    or return 1
    set -q _flag_work; or set _flag_work 25
    set -q _flag_break; or set _flag_break 5
    set -q _flag_sessions; or set _flag_sessions 4

    for session in (seq $_flag_sessions)
        echo "Pomo! Session $session/$_flag_sessions - focus for $_flag_work min"
        notify "Session $session: work time!"
        countdown (math $_flag_work x 60)
        echo "Coffee! Break for $_flag_break min"
        notify "Session $session: break time!"
        countdown (math $_flag_break x 60)
    end
    notify "All $_flag_sessions sessions done. Yohoo!"
end
