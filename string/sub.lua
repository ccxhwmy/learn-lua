-- 显示源字符串
local sourcestr = "prefix--de asdsdjjj\0dsfdf56\0mfa54--suffix"
print("\nsourcestr is", string.format("%q", sourcestr))

local first_sub = string.sub(sourcestr, 4)
print("\nfirst_sub is", string.format("%q", first_sub))