-- 打印字符串
local retstr = string.format("\ntoday is %s", os.date())
print(retstr)

-- 打印数字
retstr = string.format("\nmy age is %d", 22)
print(retstr)

-- 使用科学计数法表示
retstr = string.format("\nthe number 1024 = %e", 1024)
print(retstr)

-- 无符号数字-1==4294967295
retstr = string.format("\nthe unsigned number is %u", -1)
print(retstr)

-- 有符号数字-1
retstr = string.format("\nthe number is %d", -1)
print(retstr)

-- 常规字符串
retstr = string.format("\nthe content1 is %s", 
    "content1 is haha\n\0content1 second line")
print(retstr)

-- 特殊字符串
retstr = string.format("\nthe content1 is %q", 
    "content2 is haha\n\0content2 second line")
print(retstr)