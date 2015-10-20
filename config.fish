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
set dcolor 6600CC
set datetime (date "+%H:%M%p")

function fish_prompt
	 set rc $status
	 if [ (whoami) != 'root' ]
	    set ucolor B2FF66
	    set pchar "\$ "
	 else
	    set ucolor FF6666
	    set pchar "# "
	 end
	 echo $rc (set_color $dcolor)$datetime(set_color normal):(set_color $ucolor)(whoami)@(hostname)(set_color normal):(set_color $pcolor)" "(prompt_pwd) $pchar
end

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias la="ls -lah"
alias refresh=". /etc/fish/config.fish"
# alias update="bash $HOME/shell-scripts/updateserver.sh"
