local sourcestr = "ehre99wj=--=-*-/4mdqwl\0ds123fef"
print("\nsourcestr = "..sourcestr)

local match_ret = string.match(sourcestr, "%d%d%d")
print("\nmatch_ret is "..match_ret)

match_ret = string.match(sourcestr, "%d%a%a")
print("\nmatch_ret is "..match_ret)

match_ret = string.match(sourcestr, "")
print("\nmatch_ret is "..match_ret)

match_ret = string.match(sourcestr, "%d%d")
print("\nmatch_ret is "..match_ret)

match_ret = string.match(sourcestr, "%d%d", 10)
print("\nmatch_ret is "..match_ret)