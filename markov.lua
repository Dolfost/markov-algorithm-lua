ver = "v2.0"

local replacements = {}
function malgorithm(table)
	
	if table.name == nil then error("Could not find the name of algorithm in it's table.\n") end

	if replacements[table.name] ~= nil then
		io.stderr:write(string.format([[
			Warning: %s algorithm is being read more then once.
			It will be owerwritten with last read %s algorithm.
			]], table.name, table.name))
	end

	replacements[table.name] = table
	replacements[table.name].name = nil

end

function readstdin()
	res = {}
	local data = io.stdin:read('all')

	for inp in string.gmatch(data, '(.-)\n') do
		table.insert(res, inp)
	end

	return res
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

if args.str == nil then
	args.str = readstdin()
end


if args.verbose == true then
	for _, str in ipairs(args.str) do
	local counter = 0

	io.write(string.format("$ %s\n", str))

		while true do
			counter = counter + 1
			io.write(string.format("%-3d ", counter))

			str, tab, key, term = m.iterate(str, replacements[args.algorithm])
			
			if tab == nil then
				io.write("No more substitutions can be done.\n")
				break
			elseif term == true then
				io.write(string.format("%s -->• %s\n", key, replacements[args.algorithm][tab][key]))
				break
			else
				io.write(string.format("%s --> %s\n", key, replacements[args.algorithm][tab][key]))
			end

			io.write(string.format(">> %s\n", str))
			if counter >= args.iterations then
				io.stderr:write(string.format("The iteration limit of %d has been reached.\n", args.iterations))
				break
			end
		end

		io.write(string.format("=== %s\n\n", str))
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
