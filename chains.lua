malgorithm{ -- takes "aaa*aa" and returns "aaaaaa" (unary)
	name = "mult",
	{["Ba"] = "aB"},
	{["Aa"] = "aBA"},
	{["A"]  = ""},
	{["a*"] = "*A"},
	{["*a"] = "*"},
	{["*"] = ""},
	{["B"] = "a"},
}

malgorithm{ -- takes "aaaa|aa" and returns gcd(aaaa, aa) (unary)
	name = "gcd",
	{["aA"] = "Aa"},
	{["a|a"] = "A|"},
	{["a|"] = "|B"},
	{["B"] = "a"},
	{["A"] = "C"},
	{["C"] = "a"},
	{["|"] = ""}
}

malgorithm{ -- takes "aaa-aa" and returns "a" (unary)
	name = "diff",
	{["a-a"] = "-"},
	{["a-"] = "a", terminating = true},
	{["-a"] = "-a", terminating = true}
}

--[[
malgorithm{ -- takes "2^a...a-3^a...a" and returns "aa...aaa"
	name = "2^x-3^y",

	{["Ba"] = "aB"},
	{["Aa"] = "aBA"},
	{["A"]  = ""},
	{["a*"] = "*A"},
	{["*a"] = "*"},
	{["*"] = ""},
	{["B"] = "a"},


	{["2^a"] = "aa*2^"},
	{["*2^"] = ""},
	{["3^a"] = "aaa*3^"},
	{["*3^"] = ""},



	{["a-a"] = "-"},
	{["a-"] = "a", terminating = true},
	{["-a"] = "-a", terminating = true}
}
--]]
