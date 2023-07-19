m = require "./markovlib"

local mult = { -- takes "aaa*aa" and returns "aaaaaa"
	{["Ba"] = "aB"},
	{["Aa"] = "aBA"},
	{["A"]  = ""},
	{["a*"] = "*A"},
	{["*a"] = "*"},
	{["*"] = ""},
	{["B"] = "a"},
}

local gcd = { -- takes "aaaa|aa" and returns gcd(aaaa, aa) (unary)
	{["aA"] = "Aa"},
	{["a|a"] = "A|"},
	{["a|"] = "|B"},
	{["B"] = "a"},
	{["A"] = "C"},
	{["C"] = "a"},
	{["|"] = ""}
}

local diff = { -- takes "aaa-aa" and returns "a"
	{["a-a"] = "-"},
	{["a-"] = "a", terminating = true},
	{["-a"] = "-a", terminating = true}
}



local str = "aaa*aa"
replacements = mult

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
