#/usr/bin/env ruby
#
# This file is part of shamnium. Copyright (C) 2013 and above Shogun <shogun_panda@me.com>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

require "open-uri"

contents_directory = File.dirname(__FILE__)
script = "\n[ -x /etc/shamnium.sh ] && source /etc/shamnium.sh;\n"
quiet = (ENV["SHAMNIUM_QUIET"] =~ /^(1|on|true|yes|t|y)$/i)

external_scripts = {
	"bashmarks" => ["71_bashmark", "https://raw.github.com/Bilalh/bashmarks/master/bashmarks.sh"],
	"git-completion" => ["72_git_completion", "https://raw.github.com/git/git/master/contrib/completion/git-completion.bash"]
}


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

namespace :external do
	desc "Updates an external script."
	task :update, :name do |task, args|
		script_arg = args[:name].to_s

		raise RuntimeError.new("You have to specify the name of script to update. Valid scripts are: #{external_scripts.keys.join(", ")}.") if script_arg.strip.length == 0
		raise RuntimeError.new("External script #{script} is not valid. Valid scripts are: #{external_scripts.keys.join(", ")}.") if !external_scripts[script_arg]
		final_script = external_scripts[script_arg]	

		open(contents_directory + "/shamnium.d/#{final_script[0]}.sh", "w", 0755) do |destination|
			open(final_script[1]) do |source|
				destination.write(source.read)
			end
		end
	end
end

namespace :site do
	desc "Updates site installer."
	task :update_installer do |task|
		system("git checkout gh-pages")
		system("curl -s -o installer https://raw.github.com/ShogunPanda/shamnium/master/installer && git commit -qam \"Updated site installer.\" && git push -q")
		system("git checkout master")
	end
end

task :default => ["install"]
