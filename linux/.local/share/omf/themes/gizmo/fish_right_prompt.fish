function fish_right_prompt
	
	# Colors
	set -l red (set_color -o red)
	set -l green (set_color -o green)

	# Variables
	set -l last_status $status

	if test $last_status = 0
		set prompt_color $green
	else
		set prompt_color $red
	end

	if test $last_status != 0
		#echo -n -s $prompt_color "➜ " $last_status
	end

end