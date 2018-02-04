#!/bin/sh
#
# This file is part of shamnium. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at https://choosealicense.com/licenses/mit.
#

[ -f ${rvm_path}/scripts/rvm ] && source ${rvm_path}/scripts/rvm;

rvm_prompt(){
  [ "$(which rvm-prompt)" != "" -a "$(rvm-prompt i)" != "" ] && echo " $(rvm-prompt i v g)"
}