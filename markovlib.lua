local markov = {}

--[[
-- 2^aa...a-3^aa...a
replacements = {
	{["2^a"] = "aa*2^"},
	{["*2^"] = ""},
	{["3^a"] = "aaa*3^",
	{["*3^"] = "",
	
	{["Ba"] = "aB"},
	{["Aa"] = "aBA"},
	{["A"]  = ""},
	{["a*"] = "*A"},
	{["*a"] = "*"},
	{["*"] = ""},
	{["B"] = "a"},

	{["a-a"] = "-"},
	{["a-"] = "a", end = true},
	{["-a"] = "-a", end = true}
--]]

local function markovkey(t) -- t is a replacements table
	return function (t, i)
		i = i + 1
		idx, val = next(t[i])
		if idx == "end" then
			idx, val = next(t[i], "end")
		end
		return idx, val, tab
	end, t, 0
end

function markov.iterate(string, replacements)
	local key = ""
	local tab = 0
	local finish = false

	for key, repl, tab in markovkey(replacements) do
		string, n = string.gsub(stiring, key, repl, 1)
		if n == 1 then break end
	end

	return string, tab, key
end

return markov
