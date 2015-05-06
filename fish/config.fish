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
set base_color normal
set offset_color yellow
set uname_color green
set root_color red
set username (whoami)

function fish_prompt
	 if [ (whoami) != 'root' ]
	    printf '%s%s %s%s %s%s%s >> ' (set_color $uname_color) (whoami) (set_color $base_color) (pwd) (set_color $offset_color) (date "+%H:%M:%S") (set_color $base_color)
	 end
	 if [ (whoami) = 'root' ]
	    printf '%s%s %s%s %s%s%s >> ' (set_color $root_color) (whoami) (set_color $base_color) (pwd) (set_color $offset_color) (date "+%H:%M:%S") (set_color $base_color)
	 end
end
