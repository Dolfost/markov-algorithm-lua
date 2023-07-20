io.output("sorting.lua")

function escape(char)
	char = string.char(char)
	if char == "\"" or char == "\\" then return "\\" .. char end
	return char
end

io.write(
[[
malgorithm{
    name = "sort", -- sorts number string
]])
for i = 0, 9 do
	for j = 0, 9 do
		if i > j then
			io.write(string.format("    {[\"%d%d\"] = \"%d%d\"},\n", i, j, j, i))
		end
	end
end
io.write("}\n\n")


io.write(
[[
malgorithm{
    name = "sortall", -- sorts string
]])
for i = 33, 126 do
	for j = 33, 126 do
		if i > j then
			local i = escape(i)
			local j = escape(j)
			io.write(string.format("    {[\"%s%s\"] = \"%s%s\"},\n", i, j, j, i))
		end
	end
end
io.write("}\n")
