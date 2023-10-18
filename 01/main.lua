function example1()
    function fact(n)
        if n == 0 then
            return 1
        else
            return n * fact(n - 1)
        end
    end

    print("enter a number: ")
    local a = io.read("*number") -- read a number

    print(fact(a))
end

example1()
