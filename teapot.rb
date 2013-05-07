
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "0.8.0"

define_target "ogg" do |target|
	target.build do |environment|
		build_external(package.path, "libogg-1.3.0", environment) do |config, fresh|
			if fresh
				Commands.run("./configure",
					"--prefix=#{config.install_prefix}",
					"--disable-dependency-tracking",
					"--enable-shared=no",
					"--enable-static=yes",
					*config.configure
				)
			end
			
			Commands.make_install
		end
	end
	
	target.depends :platform
	
	target.provides "Library/ogg" do
		append linkflags "-logg"
	end
end
