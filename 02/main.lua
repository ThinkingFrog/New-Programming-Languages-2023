function example1()
    local t = {}
    t[1] = "first"
    t["name"] = 11

    print(t[1])
    print(t["name"])
end

function example2()
    local a = "строка"

    local len = #a
    print(len) -- 6

    len = #"ещё строка"
    print(len) -- 10

    a = "Кронос" .. "-" .. "Информ"
    print(a) -- Кронос-Информ
end

function example3()
    a = {}
    b = a
    a[1] = 10

    print(b[1]) -- 10
    b[1] = 20
    print(a[1]) -- 20
end

example1()
example2()
example3()
