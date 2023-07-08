
local function calculate()
    print(122 % 100000)

    print(122222 % 100000)

    print(200000 % 100000)
end

local function random()
    math.randomseed (100)

    for i=1, 10 do
        print(math.random(1, 2))
    end
end

calculate()
random()
