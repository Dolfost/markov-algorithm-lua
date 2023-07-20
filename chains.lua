local chains = {}

chains.mult = { -- takes "aaa*aa" and returns "aaaaaa"
	{["Ba"] = "aB"},
	{["Aa"] = "aBA"},
	{["A"]  = ""},
	{["a*"] = "*A"},
	{["*a"] = "*"},
	{["*"] = ""},
	{["B"] = "a"},
}

chains.gcd = { -- takes "aaaa|aa" and returns gcd(aaaa, aa) (unary)
	{["aA"] = "Aa"},
	{["a|a"] = "A|"},
	{["a|"] = "|B"},
	{["B"] = "a"},
	{["A"] = "C"},
	{["C"] = "a"},
	{["|"] = ""}
}

chains.diff = { -- takes "aaa-aa" and returns "a"
	{["a-a"] = "-"},
	{["a-"] = "a", terminating = true},
	{["-a"] = "-a", terminating = true}
}

return chains
