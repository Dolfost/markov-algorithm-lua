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
		:description "The Lua file with Markov algorithm"
		:argname "FILE"
		:args(1)
		:count(1)
		:convert(io.open)

	parser:option "-s --string"
		:target "str"
		:argname {"STR", "STR"}
		:description "The input string for Markov algorithm"
		:args("+")
		:count(1)
	

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
