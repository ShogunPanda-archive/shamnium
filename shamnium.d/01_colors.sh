#!/bin/sh
#
# This file is part of shamnium. Copyright (C) 2012 and above Shogun <shogun_panda@me.com>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

export SHAMNIUM_TEXT_DEFAULT='\['`tput sgr0;`'\]'
export SHAMNIUM_TEXT_BOLD='\['`tput bold;`'\]'
export SHAMNIUM_TEXT_UNDERLINE='\['`tput smul;`'\]'
export SHAMNIUM_TEXT_REVERSE='\['`tput rev;`'\]'
export SHAMNIUM_TEXT_BLINK='\['`tput blink;`'\]'

export SHAMNIUM_TEXT_COLOR_FG_BLACK='\['`tput setaf 0;`'\]'
export SHAMNIUM_TEXT_COLOR_FG_RED='\['`tput setaf 1;`'\]'
export SHAMNIUM_TEXT_COLOR_FG_GREEN='\['`tput setaf 2;`'\]'
export SHAMNIUM_TEXT_COLOR_FG_YELLOW='\['`tput setaf 3;`'\]'
export SHAMNIUM_TEXT_COLOR_FG_BLUE='\['`tput setaf 4;`'\]'
export SHAMNIUM_TEXT_COLOR_FG_MAGENTA='\['`tput setaf 5;`'\]'
export SHAMNIUM_TEXT_COLOR_FG_CYAN='\['`tput setaf 6;`'\]'
export SHAMNIUM_TEXT_COLOR_FG_WHITE='\['`tput setaf 7;`'\]'

export SHAMNIUM_TEXT_COLOR_BG_BLACK='\['`tput setab 0;`'\]'
export SHAMNIUM_TEXT_COLOR_BG_RED='\['`tput setab 1;`'\]'
export SHAMNIUM_TEXT_COLOR_BG_GREEN='\['`tput setab 2;`'\]'
export SHAMNIUM_TEXT_COLOR_BG_YELLOW='\['`tput setab 3;`'\]'
export SHAMNIUM_TEXT_COLOR_BG_BLUE='\['`tput setab 4;`'\]'
export SHAMNIUM_TEXT_COLOR_BG_MAGENTA='\['`tput setab 5;`'\]'
export SHAMNIUM_TEXT_COLOR_BG_CYAN='\['`tput setab 6;`'\]'
export SHAMNIUM_TEXT_COLOR_BG_WHITE='\['`tput setab 7;`'\]'
