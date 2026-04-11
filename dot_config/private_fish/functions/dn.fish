function dn
    # Get the name of the current directory.
    set current (basename $PWD)

    # Define the regex pattern for one or more digits.
    # Fish uses the 'string match' command for regex comparisons.
    set number_re '^[0-9]+$'

    # Check if the current directory name matches the number pattern.
    if string match --regex $number_re $current
        # The current directory is a number. Calculate the next number.
        # Fish uses the math command for arithmetic.
        set next (math $current + 1)

        # Create the next directory, change into it, and run 'rpg ls'.
        # 'command' is not needed in fish to bypass function name alias.
        mkdir -p $next
        cd $next
        rpg ls

    # Check if a directory named '1' exists in the current location.
    else if test -d 1
        # Directory '1' exists. Change into it and run 'rpg ls'.
        cd 1
        rpg ls

    # If neither of the above, create the 'dungeon/1' path.
    else
        # Create the full path, change into 'dungeon/1', and run 'rpg ls'.
        mkdir -p dungeon/1
        cd dungeon/1
        rpg ls
    end
end
