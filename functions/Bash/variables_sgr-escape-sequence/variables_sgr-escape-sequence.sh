#!/usr/bin/env bash

# In the cases where I dont' know the tput commands,
# I have used hardcoded ANSI/VT100 escape sequences as they
# are recognized on Mac OS X where I write most of my scripts.

# I have a blog post about how to use these variables in a script here:
# http://erikberglund.github.io/2016/Script_Tip_Modifying_text_appearance_in_console_output/

sgr_color() {
	# Foreground text colors
	blk=$(tput setaf 0) # Black
	red=$(tput setaf 1) # Red
	grn=$(tput setaf 2) # Green
	yel=$(tput setaf 3) # Yellow
	blu=$(tput setaf 4) # Blue
	mag=$(tput setaf 5) # Magenta
	cya=$(tput setaf 6) # Cyan
	whi=$(tput setaf 7) # White
	def=$'\e[39m'       # Default foreground color
	
	# Deactivate ALL sgr attributes and colors.
	clr=$(tput sgr0)
}

sgr_bgcolor() {
	# Background text colors
	bgblk=$(tput setab 0) # Black
	bgred=$(tput setab 1) # Red
	bggrn=$(tput setab 2) # Green
	bgyel=$(tput setab 3) # Yellow
	bgblu=$(tput setab 4) # Blue
	bgmag=$(tput setab 5) # Magenta
	bgcya=$(tput setab 6) # Cyan
	bgwhi=$(tput setab 7) # White
	bgdef=$'\e[49m'       # Default foreground color
	
	# Deactivate ALL sgr attributes and colors.
	clr=$(tput sgr0)
}

sgr_attributes() {
	# Activate text attributes
	bld=$(tput bold)  # Bold
	dim=$(tput dim)   # Dim
	uln=$(tput smul)  # Underline
	bnk=$(tput blink) # Blink
	rev=$(tput rev)   # Reverse
	sto=$(tput smso)  # Standout
	
	# Deactivate text attributes
	nobld=$'\e[22m'    # Deactivate Bold
	nouln=$(tput rmul) # Deactivate Underline
	nobnk=$'\e[25m'    # Deactivate Blink
	norev=$'\e[27m'    # Deactivate Reverse
	nosto=$(tput rmso) # Deactivate Standout
	
	# Deactivate ALL sgr attributes and colors.
	clr=$(tput sgr0)
}
