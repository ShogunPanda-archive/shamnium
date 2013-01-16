#/usr/bin/env ruby
#
# This file is part of shamnium. Copyright (C) 2012 and above Shogun <shogun_panda@me.com>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

require "open-uri"

contents_directory = File.dirname(__FILE__)
script = "\n[ -x /etc/shamnium.sh ] && source /etc/shamnium.sh;\n"
bashmarks_url = "https://raw.github.com/Bilalh/bashmarks/master/bashmarks.sh"
quiet = (ENV["SHAMNIUM_QUIET"] =~ /^(1|on|true|yes|t|y)$/i)

desc "Installs the environment."
task :install do |task|
	files = FileList["shamnium.sh", "shamnium.d"]
	FileUtils.cp_r(files, "/etc/", :verbose => !quiet)
	FileUtils.chmod_R(0755, FileList["/etc/shamnium.sh", "/etc/shamnium.d"], :verbose => !quiet)

	# Patch the profile file
	File.open("/etc/profile", "r+") do |f|
		contents = f.read

		if !contents.include?(script) then
			f.write("\n") if contents[-1, 1] != "\n"
			f.write(script)
		end
	end	

	puts "-------\n\nTo load shamnium.sh, just type: source /etc/profile"	if !quiet
end

desc "Uninstalls the environment."
task :uninstall do |task|
	verbose = /^(1|on|true|yes|t|y)$/i.match(args[:verbose]) || false
	
	FileUtils.rm_r(FileList["/etc/shamnium.sh", "/etc/shamnium.d"], :verbose => !quiet)

	contents = ""
	# Patch the profile file
	File.open("/etc/profile", "r+") do |f|
		contents = f.read
	end

	File.open("/etc/profile", "w+") do |f|
		f.write(contents.gsub(script, ""))
	end	

	puts "-------\n\nTo unload shamnium.sh, just type: source /etc/profile"	if !quiet
end

namespace :bashmarks do
	desc "Updates baskmarks."
	task :update do |task|
		open(contents_directory + "/shamnium.d/71_bashmark.sh", "w", 0755) do |destination|
			open(bashmarks_url) do |source|
				destination.write(source.read)
			end
		end
	end
end

task :default => ["install"]
