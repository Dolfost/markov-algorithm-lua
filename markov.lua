ver = "v1.0"

local m = require "./markovlib"
local chains = require "./chains"

local args = require "./options"

replacements = chains.mult


if args.verbosity == true then
	for _, str in ipairs(args.str) do
	local counter = 0

	io.write(string.format("$ %s\n", str))

		while true do
			counter = counter + 1
			io.write(string.format("%-3d ", counter))

			str, tab, key, term = m.iterate(str, replacements)
			
			if tab == nil then
				io.write("No substitutions can be done.\n")
				break
			elseif term == true then
				io.write("The terminating substitution was done.\n")
				break
			else
				io.write(string.format("%s --> %s\n", key, replacements[tab][key]))
			end

			io.write(string.format(">> %s\n", str))
			-- if counter >= 40 then break end
		end

		io.write(string.format("=== %s\n", str))
	end
else
	for _, str in ipairs(args.str) do
		while true do
			str, tab, key, term = m.iterate(str, replacements)
			if tab == nil or term == true then break end
		end

		io.write(string.format("%s\n", str))
	end
end

