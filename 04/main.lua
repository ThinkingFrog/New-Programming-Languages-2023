function io_example1()
    local temp = io.input()
    io.input("hello.txt")

    print(io.read("a")) -- Hello, world!

    io.input():close()
    io.input(temp)
end

function io_example2()
    io.write("sin (3) = ", math.sin(3), "\n")                -- sin (3) = 0.14112000805987
    io.write(string.format("sin (3) = %.4f\n", math.sin(3))) -- sin (3) = 0.1411
end

function io_example3()
    local temp = io.input()
    io.input("matrix.txt")

    while true do
        local n1, n2, n3 = io.read("*n", "*n", "*n")
        if not n1 then break end
        print(math.max(n1, n2, n3))
        -- 15000000000000.0
        -- 1000001
    end

    io.input():close()
    io.input(temp)
end

function closure_example1()
    local function makeGreeter(name)
        local text = "Hello, " .. name
        local function greet()
            print(text)
        end
        greet()
    end

    makeGreeter("Bob") --> "Hello, Bob"
end

function closure_example2()
    local function makeGreeter(name)
        local text = "Hello, " .. name
        return function()
            print(text)
        end
    end

    local greet = makeGreeter("Bob")
    greet() -- "Hello, Bob"
end

function closure_example3()
    local function makeAdder(a)
        return function(b)
            return a + b
        end
    end

    local add5 = makeAdder(5)
    print(add5(4)) --> 9
end

function closure_example4()
    local function make(initial)
        local value = initial or 0
        local function get()
            return value
        end
        local function set(newValue)
            value = newValue
        end
        return get, set
    end

    local getX, setX = make()

    setX(50)

    print(getX()) --> 50
end

function closure_example5()
    local funcs = {}
    for i = 1, 10 do -- каждую итерацию объявляется новая переменная i
        funcs[i] = function() return i end
    end

    for _, func in ipairs(funcs) do
        print(func())
        -- 1
        -- 2
        -- 3
        -- 4
        -- 5
        -- 6
        -- 7
        -- 8
        -- 9
        -- 10
    end
end

function generics_example1()
    local function foo(value)
        print(value)
    end

    local function bar(value)
        print(value + 1)
    end

    foo(42)      -- 42
    foo("Hello") -- "Hello"
    bar(42)      -- 43
    -- bar("Hello") -- lua: main.lua:101: attempt to add a 'string' with a 'number'
end

function generics_example2()
    local t = {}
    local x = 10

    print(type(t))       -- table
    print(type(4))       -- number
    print(type(x))       -- number
    print(type("Hello")) -- string
end

function functional_example()
    require "fun" ()
    -- calculate sum(x for x^2 in 1..n)
    local n = 100
    print(reduce(operator.add, 0, map(function(x) return x ^ 2 end, range(n)))) -- 328350
end

io_example1()
io_example2()
io_example3()

closure_example1()
closure_example2()
closure_example3()
closure_example4()
closure_example5()

generics_example1()
generics_example2()

functional_example()
