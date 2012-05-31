#/usr/bin/env ruby
#
# This file is part of cowtech-sh. Copyright (C) 2012 and above Shogun <shogun_panda@me.com>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

require "open-uri"

contents_directory = File.dirname(__FILE__)
script = "\n[ -x /etc/cowtech.sh ] && source /etc/cowtech.sh;\n"

desc "Installs the environment."
task :install do |task|
	files = FileList["cowtech.sh", "cowtech.d"]
	FileUtils.cp_r(files, "/etc/", :verbose => true)
	FileUtils.chmod_R(0755, FileList["/etc/cowtech.sh", "/etc/cowtech.d"], :verbose => true)

	# Patch the profile file
	File.open("/etc/profile", "r+") do |f|
		contents = f.read

		if !contents.include?(script) then
			f.write("\n") if contents[-1, 1] != "\n"
			f.write(script)
		end
	end	

	puts "-------\n\nTo load cowtech.sh, just type: source /etc/profile"	
end

desc "Uninstalls the environment."
task :uninstall do |task|
	FileUtils.rm_r(FileList["/etc/cowtech.sh", "/etc/cowtech.d"], :verbose => true)

	contents = ""
	# Patch the profile file
	File.open("/etc/profile", "r+") do |f|
		contents = f.read
	end

	File.open("/etc/profile", "w+") do |f|
		f.write(contents.gsub(script, ""))
	end	

	puts "-------\n\nTo unload cowtech.sh, just type: source /etc/profile"	
end

namespace :bashmarks do
	desc "Updates baskmarks."
	task :update do |task|
		open(contents_directory + "/cowtech.d/71_bashmark.sh", "w", 0755) do |destination|
			open("https://raw.github.com/huyng/bashmarks/master/bashmarks.sh") do |source|
				destination.write(source.read)
			end
		end
	end
end

task :default => ["cowtech_sh:install"]
