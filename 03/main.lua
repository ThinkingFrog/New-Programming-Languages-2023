function table_example1()
    local t = { 0, 1, 2 }

    print(t[0]) -- nil
    print(t[1]) -- 0
end

function table_example2()
    local t = {}
    local tt = {}

    t["hello"] = "world"
    tt["inner table as value"] = t
    tt.t = "inner table as key"

    print(tt["t"]) -- inner table as key
    print(tt.t)    -- inner table as key
end

function table_example3()
    local tt = {}
    local t = {}

    t.x = 1
    tt.x = t.x
    tt.x = 10
    print(tt.x) -- 10
    print(t.x)  -- 1

    tt.t = t
    print(t)    -- table: 0x558f34f0ecb0
    print(tt.t) -- table: 0x558f34f0ecb0
end

function table_example4()
    local t = { 42, 356, x = 1, 56 }

    print(t[1])   -- 42
    print(t["x"]) -- 1
    print(t[3])   -- nil

    t = { 42, 356, x = 1, 56 }

    print(t[1])   -- 42
    print(t["x"]) -- 1
    print(t[3])   -- 56
end

function table_example5()
    local t = {}
    local tt = {}

    tt.t = t
    print(t)    -- table: 0x558f34f0ecb0
    print(tt.t) -- table: 0x558f34f0ecb0

    t = nil
    print(tt.t) -- table: 0x558f34f0ecb
end

function metatable_example1()
    function merge_tables(table1, table2)
        table3 = {}
        for k, v in pairs(table1) do table3[k] = v end
        for k, v in pairs(table2) do table3[k] = v end
        return table3
    end

    local t1 = { x = 4 }
    local t2 = { y = 6 }

    setmetatable(t2, { __add = merge_tables })

    local t3 = t2 + t1

    print(t3.x) -- 4
    print(t3.y) -- 6
end

table_example1()
table_example2()
table_example3()
table_example4()
table_example5()
metatable_example1()
