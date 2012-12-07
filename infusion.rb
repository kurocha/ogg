
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

required_version "0.5"

define_package "ogg" do |package|
	package.install do |environment|
		environment.use in:(package.path + 'libogg-1.3.0') do |config|
			Commands.run("make", "clean") if File.exist? "Makefile"
				
			Commands.run("./configure",
				"--prefix=#{config.install_prefix}",
				"--disable-dependency-tracking",
				"--enable-shared=no",
				"--enable-static=yes",
				*config.configure
			)
			
			Commands.run("make", "install")
		end
	end
	
	package.depends :system
	
	package.provides "Library/ogg" do
		append linkflags "-logg"
	end
end
