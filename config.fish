#
# Init file for fish
#

#
# Some things should only be done for login terminals
#

if status --is-login

	#
	# Set some value for LANG if nothing was set before, and this is a
	# login shell.
	#

	if not set -q LANG >/dev/null
		set -gx LANG en_US.UTF-8
	end

	# Check for i18n information in
	# /etc/sysconfig/i18n

	if test -f /etc/sysconfig/i18n
		eval (cat /etc/sysconfig/i18n |sed -ne 's/^\([a-zA-Z]*\)=\(.*\)$/set -gx \1 \2;/p')
	end

	#
	# Put linux consoles in unicode mode.
	#

	if test "$TERM" = linux
		if expr "$LANG" : ".*\.[Uu][Tt][Ff].*" >/dev/null
			if which unicode_start >/dev/null
				unicode_start
			end
		end
	end
end
set pcolor C0C0C0
set dcolor 7D47B2

function git_hash
     set -g git_hash (git rev-parse --short HEAD)
     if [ $status -ne 0 ]
     	echo " "
     else
	echo " $git_hash] "
     end
end

function git_branch
    set -g git_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
    if [ $status -ne 0 ]
        echo " "
    else
	
        echo " [$git_branch"
    end
end

function fish_prompt
	 set rc $status
	 if [ (whoami) != 'root' ]
	    set ucolor 7CB247
	    set pchar "\$ "
	 else
	    set ucolor FF6666
	    set pchar "# "
	 end
	 echo $rc (set_color $dcolor)(date "+%I:%M%p")(set_color normal):(set_color $ucolor)(whoami)@(hostname)(set_color normal):(set_color $pcolor)" "(prompt_pwd)(set_color yellow)(git_branch)(git_hash)(set_color $pcolor)$pchar
end

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias la="ls -lah"
alias df="df --total -h"
alias refresh=". /etc/fish/config.fish"
# alias update="bash $HOME/shell-scripts/updateserver.sh"
