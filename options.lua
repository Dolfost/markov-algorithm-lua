local argparse = require "argparse"

local parser = argparse()
	:name "Markov algorithms"
	:description "This program runs Lua Markov algorithms"
	:epilog "Epilog."
	:help_max_width(80)
	:usage_max_width(70)
	:help_vertical_space(1)


parser:group "Options"
	parser:option "-f --file"
		:target "files"
		:description "The Lua files with Markov algorithms"
		:argname {"FILE", "FILE"}
		:args("+")
		:count(1)
		:convert(function (filename)
			f, msg = io.open(filename)

			if f == nil then
				io.stderr:write(msg)
				os.exit(1)
			end

			return filename
		end)
		:overwrite(false)

	parser:option "-s --string"
		:target "str"
		:argname {"STR", "STR"}
		:description "The input strings for Markov algorithm"
		:args("+")
		:count(1)
		:overwrite(false)

	parser:option "-a --algorithm"
		:argname "ALG"
		:description "The algorithm name from FILE"
		:args(1)
		:count(1)
		:overwrite(false)
	

parser:group "Flags"
	parser:flag "-v --version"
		:action(function ()
			io.write(string.format("Markov Algorithm program %s.\n", ver))
			os.exit(0)
		end)

	parser:mutex(
		parser:flag "-v --verbose"
			:target "verbosity"
			:action "store_true",
		parser:flag "-q --quiet"
			:action "store_true"
	)


return parser:parse()
