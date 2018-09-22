n = 4   # number of questions
score = 0
for i in 1:n
    a = rand(1:10)
    b = rand(1:10)
    print(a, "*", b, " = ")
    c = Meta.parse(readline(stdin))
    if a*b == c
        println("Correct!")
        global score += 1
    else
        println(a, "*", b, " = ", a*b, " Wrong")
    end
end
println("Score $score/$n")