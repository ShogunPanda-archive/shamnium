#!/bin/sh
#
# This file is part of cowtech-sh. Copyright (C) 2012 and above Shogun <shogun_panda@me.com>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

# PROMPT
prompt_date="\D{%Y-%m-%d %H:%M}" # format as in strftime
prompt_hostname="\h"
prompt_username="\u"
prompt_dir="\w"
prompt_number="\!"
prompt_type="\$"

prompt_git(){
	git branch --no-color 2>/dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}

# # SET USERNAME PROMPT COLOR
prompt_username_color="${CT_TEXT_COLOR_FG_GREEN}"
[ "$UID" = "0" ] && prompt_username_color="${CT_TEXT_COLOR_FG_RED}"

# # SET THE PROMPT
PS1="${CT_TEXT_BOLD}${CT_TEXT_COLOR_FG_YELLOW}[${CT_TEXT_COLOR_FG_WHITE}${prompt_date}${CT_TEXT_COLOR_FG_YELLOW}]${CT_TEXT_DEFAULT}" # DATE
PS1="${PS1} ${CT_TEXT_COLOR_FG_CYAN}${prompt_dir}${CT_TEXT_COLOR_FG_MAGENTA}\$(prompt_git)${CT_TEXT_DEFAULT}"
PS1="${PS1}\n"
PS1="${PS1}${CT_TEXT_BOLD}${CT_TEXT_COLOR_FG_YELLOW}[${prompt_username_color}${prompt_username}@${prompt_hostname}${CT_TEXT_COLOR_FG_YELLOW}]${CT_TEXT_DEFAULT}" # HOST
PS1="${PS1} ${CT_TEXT_BOLD}${CT_TEXT_COLOR_FG_YELLOW}${prompt_type}> ${CT_TEXT_DEFAULT}" 

PS2="${CT_TEXT_BOLD}${CT_TEXT_COLOR_FG_YELLOW}» ${COLOR_DEFAULT}"

# EXPORT PROMPT
export PS1 PS2