#!/bin/sh
#
# This file is part of shamnium. Copyright (C) 2013 and above Shogun <shogun_panda@me.com>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

# Load configuration files
for file in /etc/shamnium.d/*; do
	[ -x ${file} ] && source ${file}
done;

# Load additional configuration files
for file in /etc/profile.d/*; do
	[ -x ${file} ] && source ${file}
done;
