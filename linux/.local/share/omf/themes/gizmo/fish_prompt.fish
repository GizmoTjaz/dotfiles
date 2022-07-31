# name: Gizmo

function _git_branch_name
	echo (command git symbolic-ref HEAD 2> /dev/null | sed -e "s|^refs/heads/||")
end

function fish_prompt

	# Colors
	set -l cyan (set_color -o brblue)
	set -l red (set_color -o red)
	set -l green (set_color -o green)
	set -l magenta (set_color -o magenta)
	set -l normal (set_color normal)
	
	# Icons
	set -l wsl "❖"
	set -l home_dir "~"
	set -l root "\$"

	# Variables
	set -l cwd $magenta(pwd | sed "s|^$HOME|$home_dir|i" | sed "s|^/mnt/c/Users/$USER|$wsl $home_dir|i")

	if fish_is_root_user
		echo -n $cyan($root) 	
	end

	#echo -e ''

	echo -n -s $cwd $cyan

	# Show git branch
	if [ (_git_branch_name) ]
		echo -n -s " (" (_git_branch_name) ")"
	end

	# Next line
	echo ""

	echo -n "➜ " $normal

end
