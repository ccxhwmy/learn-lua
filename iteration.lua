local function test_for()
    local config = {
        "a", "b", "c"
    }

    local index = 0
    for _, v in pairs(config) do
        print("val: ", v)
    end

    for i = 1, 2 do
        print("i: ", i)
    end

    index = 0
    for i = 1, 10 do
        index = index + i
    end
    print(index)
end

local function test_if()
    local need_action = true

    if need_action then
        print("need_action")
    else
        print("no!!!!!!!!!")
    end

    need_action = false
    if not need_action then
        print("not need action")
    end
end

test_for()
test_if()
