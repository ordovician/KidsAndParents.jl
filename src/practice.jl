export practice, practice_doz

"""
    practice(n = 10, range = 1:9, disp = string, parser = Meta.parse; operator = *)
Practice adding, multiplying, dividing or substracting numbers. 

You will be asked to perform `n` calculations performing an aritmetic operation on two numbers. Each number will be picked from
the range `range`. 

The numbers will be displayed in decimal format by default, but you can overide
that and show it in dozenal (12 based) format instead by setting disp to `doz`.

Your answer will be parsed as a decimal number, but you can override that by supplying e.g. `parse_doz`
to the `parser` argument.

By default arithmetic operation used is multiplication. But you can practive adding numbers as well.

# Examples
Practive doing multiplication
```julia
practice(operator = +)
```

Test yourself 5 times with number in the range 5 - 12, where the numbers are displayed in dozenal format
and answers are expected in dozenal format.
```julia
practice(5, 5:12, doz, parse_doz, operator = +)
```
"""
function practice(n = 10, range = 1:9, disp = string, parser = Meta.parse; operator = *)
    correct = 0
    t = time()
    for i in 1:n
        a = rand(range)
        b = rand(range)
        msg = join([disp(a), string(operator), disp(b), " = "])
        print(msg)
        c = parser(readline(stdin))
        if c != operator(a, b)
            print(msg, disp(operator(a, b)))
            printstyled(" Wrong\n", color = :red)
            
        else
            printstyled("Correct!\n", color = :green)
            correct += 1
        end
        println("")
    end
    dt = round(time() - t)
    println("$correct/$n")
    println("Time: $dt")
end

"Practice multiplication or dozenal numbers"
practice_doz(n = 10, range = 1:11) = practice(n, range, doz, parse_doz)
