local tb_tmp = {
    "aaaa",
    "aaaa",
    "aaaa",
    "aaaa",
    "aaaa",
    "aaaa"
}

for i = 1, # tb_tmp do
    tb_tmp[i] = "111111"
end

print(unpack(tb_tmp))