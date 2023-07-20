ver = "v1.0"

local m = require "./markovlib"

local chains = require "./chains"

local args = require "./options"


local str = "aaa*aa"
replacements = chains.mult

local counter = 0
io.write(string.format("$ %s\n", str))

while true do
	counter = counter + 1
	io.write(string.format("%-3d ", counter))

	str, tab, key, term = m.iterate(str, replacements)
	
	if tab == nil then
		io.write("No substitutions could be done. Terminating...\n")
		break
	elseif term == true then
		io.write("The last substitution was done. Terminating...\n")
		break
	else
		io.write(string.format("%s --> %s\n", key, replacements[tab][key]))
	end

	io.write(string.format(">> %s\n\n", str))
	-- if counter >= 40 then break end
end

io.write(string.format("> %s\n", str))
