#!/bin/sh
#
# This file is part of cowtech-sh. Copyright (C) 2012 and above Shogun <shogun_panda@me.com>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

# Load configuration files
for file in ./cowtech.d/*; do
	[ -x ${file} ] && source ${file}
done;

# Load additional configuration files
for file in /etc/profile.d/*; do
	[ -x ${file} ] && source ${file}
done;