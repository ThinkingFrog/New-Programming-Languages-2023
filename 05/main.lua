function class_example1()
    local Account = { balance = 0 }
    function Account.withdraw(v)
        Account.balance = Account.balance - v
    end

    Account.withdraw(100.00)
end

function class_example2()
    local Account = { balance = 0 }

    function Account.withdraw(self, v)
        self.balance = self.balance - v
    end

    local a1 = Account
    a1.withdraw(a1, 100.00)

    local a2 = { balance = 0, withdraw = Account.withdraw }
    a2.withdraw(a2, 260.00)
end

function class_example3()
    local Account = { balance = 0 }

    function Account:withdraw(v)
        self.balance = self.balance - v
    end

    local a1 = Account
    a1.withdraw(a1, 100.00)

    a1:withdraw(100.00)
end

function class_example4()
    local Account = {
        balance = 0,
        withdraw = function(self, v)
            self.balance = self.balance - v
        end
    }

    function Account:deposit(v)
        self.balance = self.balance + v
    end

    Account.deposit(Account, 200.00)
    Account:withdraw(100.00)
end

function class_example5()
    local Account = {
        balance = 0,
        withdraw = function(self, v)
            self.balance = self.balance - v
        end
    }
    local a = {}

    setmetatable(a, { __index = Account })

    function Account:new(o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end

    function Account:deposit(v)
        self.balance = self.balance + v
    end

    a = Account:new { balance = 0 }
    a:deposit(100.00)
end

function class_example6()
    local Account = { balance = 0, limit = 10000 }

    function Account:new(o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end

    function Account:deposit(v)
        self.balance = self.balance + v
    end

    function Account:withdraw(v)
        if v > self.balance then
            error("insufficient funds")
        end
        self.balance = self.balance - v
    end

    local SpecialAccount = Account:new()

    SpecialAccount = Account:new()
    local s = SpecialAccount:new()

    s:deposit(100.00)

    function SpecialAccount:getLimit()
        return self.limit or 0
    end

    function SpecialAccount:withdraw(v)
        if v - self.balance >= self:getLimit() then
            error("insufficient funds")
        end
        self.balance = self.balance - v
    end

    s:withdraw(200.00)
end

function coroutine_example1()
    local co = coroutine.create(function() print("hi") end)
    print(co)

    print(coroutine.status(co)) --> suspended
    coroutine.resume(co)        --> hi
    print(coroutine.status(co)) --> dead
end

function coroutine_example2()
    function foo(a)
        print("foo", a)
        return coroutine.yield(2 * a)
    end

    local co = coroutine.create(function(a, b)
        print("co-body1", a, b)
        local r = foo(a + 1)
        print("co-body2", r)
        local r, s = coroutine.yield(a + b, a - b)
        print("co-body3", r, s)
        return b, "end"
    end)

    print("main1", coroutine.resume(co, 1, 10))
    print("main2", coroutine.resume(co, "r"))
    print("main3", coroutine.resume(co, "x", "y"))
    print("main4", coroutine.resume(co, "x", "y"))
end

function error_example1()
    print "enter a number:"
    local n = io.read("*number")
    if not n then error("invalid input") end
end

function error_example2()
    print "enter a number:"
    local n = assert(io.read("*number"), "invalid input")
end

function error_example3()
    function foo()
        assert(2 + 2 == 5)
    end

    if pcall(foo) then
        print("Everything is good")
    else
        print("Caught an exception")
    end
end

function error_example4()
    local status, err = pcall(function() error({ code = 121 }) end)
    print(err.code) -->  121
end

class_example1()
class_example2()
class_example3()
class_example4()
class_example5()
class_example6()

coroutine_example1()
coroutine_example2()

error_example1()
error_example2()
error_example3()
error_example4()
