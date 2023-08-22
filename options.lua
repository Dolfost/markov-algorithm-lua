local argparse = require "argparse"

local parser = argparse()
	:name "Markov algorithms"
	:description "This program runs Lua Markov algorithms"
	:epilog "You can find the Lua Markov algorithms examples in chains.lua and sorting.lua."
	:help_max_width(80)
	:usage_max_width(70)
	:help_vertical_space(1)


parser:option "-f --file"
	:target "files"
	:description "The Lua files with Markov algorithms"
	:argname {"FILE", "FILE"}
	:args("+")
	:count(1)
	:convert(function (filename)
		f, msg = io.open(filename)

		if f == nil then
			io.stderr:write(msg, "\n")
			os.exit(1)
		end

		return filename
	end)
	:overwrite(false)

parser:option "-s --string"
	:target "str"
	:argname {"STR", "STR"}
	:description "The input strings for Markov algorithm. Can be omitted if script is getting the input from pipe: echo 'aa*aaa' | lua markov.lua -f chains.lua -a mult"
	:args("+")
	:count("0-1")
	:overwrite(false)

parser:option "-a --algorithm"
	:argname "ALG"
	:description "The algorithm name from FILE"
	:args(1)
	:count(1)
	:overwrite(false)

parser:option "-i --iterations"
	:argname "INT"
	:description "The max iterations count"
	:args(1)
	:count("?")
	:convert(tonumber)
	:overwrite(false)
	:default(math.huge)
	

parser:flag "--version"
	:action(function ()
		io.write(string.format("Markov Algorithm program %s\n", ver))
		os.exit(0)
	end)
	:description "Print version and exit"

parser:mutex(
	parser:flag "-v --verbose"
		:target "verbose"
		:action "store_true"
		:description "Verbose mode",
	parser:flag "-q --quiet"
		:action "store_true"
		:description "Quiet mode"
)


return parser:parse()
