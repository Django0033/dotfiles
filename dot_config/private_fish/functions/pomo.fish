function pomo --description 'A simple CLI pomodoro timer for fish'
    set -l total_minutes $argv[1]
    set -l message (string join ' ' $argv[2..-1])

    if not set -q total_minutes
        echo "Oops! You forgot the time. Example: pomo 15 'Time for a break'"
        return 1
    end

    if not set -q message
        set message "Timer Finished!"
    end

    set -l total_seconds (math "$total_minutes * 60")
    set -l current_seconds $total_seconds
    set -l width 40 # Width of the progress bar

    echo "Starting timer for $total_minutes minutes..."

    while test $current_seconds -gt 0
        # Calculate progress percentage and number of bars to draw
        # Fish math handles floating point automatically.
        set -l percentage (math "(1 - $current_seconds / $total_seconds) * 100")

        # Ensure done_chars is an integer using floor and -s0 for integer output
        set -l done_chars (math -s0 "floor($percentage * $width / 100)")
        set -l left_chars (math -s0 "$width - $done_chars")

        # Build the progress bar string
        set -l progress_bar "["
        for i in (seq 1 $done_chars)
            set progress_bar "$progress_bar#"
        end
        for i in (seq 1 $left_chars)
            set progress_bar "$progress_bar-"
        end
        set progress_bar "$progress_bar]"

        # Format time to display as MM:SS
        set -l mins (math -s0 "floor($current_seconds / 60)")
        set -l secs (math -s0 "$current_seconds % 60")
        set -l display_time (printf "%02d:%02d" $mins $secs)

        # Print the timer on the same line using \r (carriage return)
        printf "\rTime remaining: %s %s (%s%%)" "$display_time" "$progress_bar" "$percentage"

        # Wait for 1 second
        sleep 1
        set current_seconds (math "$current_seconds - 1")
    end

    # Clear the progress line and print the final message
    printf "\r%s\n" (string repeat ' ' 80) # Overwrite the line with spaces
    notify-send -u critical -t 0 "$message"
    echo "$message"
end
