malgorithm{ -- takes "aaa*aa" and returns "aaaaaa" (unary multiplication)
	name = "mult",
	{["Ba"] = "aB"},
	{["Aa"] = "aBA"},
	{["A"]  = ""},
	{["a*"] = "*A"},
	{["*a"] = "*"},
	{["*"] = ""},
	{["B"] = "a"},
}

malgorithm{ -- takes "aaaa|aa" and returns gcd(aaaa, aa) (unary gcd)
	name = "gcd",
	{["aA"] = "Aa"},
	{["a|a"] = "A|"},
	{["a|"] = "|B"},
	{["B"] = "a"},
	{["A"] = "C"},
	{["C"] = "a"},
	{["|"] = ""}
}

malgorithm{ -- takes "aaa-aa" and returns "a" (unary difference)
	name = "diff",
	{["a-a"] = "-"},
	{["a-"] = "a", terminating = true},
	{["-a"] = "-a", terminating = true},
	{["-"] = "", terminating = true}
}

malgorithm{ -- takes "aaa+aa" and returns "aaaaa" (unary addition)
	name = "sum",
	{["a+a"] = "aa"},
}

malgorithm{ -- takes "a" and never halts
	name = "nohalt",
	{["a"] = "a"}
}

malgorithm{ -- converts "0101" to "aaaaa" (binary to unary conversion)
	name = "toun",
	{["1"] = "0a"},
	{["a0"] = "0aa"},
	{["0"] = ""}
}

malgorithm{ -- converts "0111*011" to "0111111" (unary like with first zero)
	name = "mult2",
	{["^1"] = "1#^"},
	{["^"] = ""},
	{["#1"] = "1#"},
	{["1*0"] = "*0^"},
	{["00"] = "0"},
	{["*0"] = "0*"},
	{["*1"] = "*"},
	{["*#"] = "1*"},
	{["*"] = "", terminating = true}
}

malgorithm{ -- doubles string "aaa" to "aaaaaa"
	name = "double",
	{["*a"] = "aa*"},
	{["*"] = "", terminating = true},
	{["a"] = "*a"}
}

malgorithm{ -- takes "aaaaa/aa" and returns "aaRa" (unary division with remainder)
	name = "div",
	{["*A"] = "Pc*"}, -- 4
	{["cP"] = "Pc"}, -- 5

	{["*"] = ""}, -- 6

	{["cc"] = "c"}, -- 7
	{["c"] = "x"}, -- 8

	{["P"] = "a"}, -- 9

	{["Aa"] = "aA"}, -- 2
	{["a/a"] = "/A"}, -- 1

	{["/aA"] = "/ar"}, -- 10 
	{["rA"] = "Ar"}, -- 11
	{["/a"] = "/"}, -- 12

	{["A"] = "*A"}, -- 3

	{["rx"] = "xr"}, -- 13
	{["xr"] = "xRr"}, -- 14
	{["/r"] = "Rr"}, -- 15

	{["/"] = ""}, -- 16

	{["r"] = "a"}, -- 17
	{["x"] = "a"}, -- 18
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
