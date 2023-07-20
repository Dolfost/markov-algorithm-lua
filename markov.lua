ver = "v1.3"

local replacements = {}
function malgorithm(table)
	
	if table.name == nil then error("Could not find the name of algorithm in it's table.\n") end

	replacements[table.name] = table
	replacements[table.name].name = nil

end

local m = require "./markovlib"
local args = require "./options"


for _, file in ipairs(args.files) do
	dofile(file)
end

if replacements[args.algorithm] == nil then
	io.stderr:write(string.format("Could not find '%s' algorithm.\n", args.algorithm))
	os.exit(1)
end


if args.verbosity == true then
	for _, str in ipairs(args.str) do
	local counter = 0

	io.write(string.format("$ %s\n", str))

		while true do
			counter = counter + 1
			io.write(string.format("%-3d ", counter))

			str, tab, key, term = m.iterate(str, replacements[args.algorithm])
			
			if tab == nil then
				io.write("No substitutions can be done.\n")
				break
			elseif term == true then
				io.write("The terminating substitution was done.\n")
				break
			else
				io.write(string.format("%s --> %s\n", key, replacements[args.algorithm][tab][key]))
			end

			io.write(string.format(">> %s\n", str))
			if counter >= args.iterations then break end
		end

		io.write(string.format("=== %s\n", str))
	end
else
	for _, str in ipairs(args.str) do
		local counter = 0

		while true do
			str, tab, key, term = m.iterate(str, replacements[args.algorithm])
			if tab == nil or term == true then break end

			if counter >= args.iterations then break end
		end

		io.write(string.format("%s\n", str))
	end
end
