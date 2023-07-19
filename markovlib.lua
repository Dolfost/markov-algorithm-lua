local markov = {}

local function escape(text)
    return text:gsub("(%W)", "%%%1")
end

local function markovkey(t) -- t is a replacements table
	return function (t, i)
		i = i + 1

		if t[i] == nil then return nil end

		key = next(t[i])

		if key == "terminating" then
			key = next(t[i], "terminating")
		end

		if key == nil then
			return nil
		end

		if t[i]["terminating"] == true then
			return i, key, true
		end

		return i, key, false
	end, t, 0
end

function markov.iterate(string, replacements)
	local key = ""
	local tab = 0
	local term = true

	local subs = false

	for t, k, tm in markovkey(replacements) do
		string, n = string.gsub(string, escape(k), replacements[t][k], 1)
		
		if n == 1 then
			subs = true
			key = k
			tab = t
			term = tm
			break
		end
	end

	if subs == false then
		return string
	end

	return string, tab, key, term
end

return markov
