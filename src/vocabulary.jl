export vocab_practice

using Random

function vocab_practice(words::Array{String,2}; order::Pair{Int64, Int64} = 1 => 2)
    # We'll ask what word given in language `a` is in language `b`
    a = words[1, first(order)]
    b = words[1, last(order)]
    
    # Create a dictonary of words from `word` table. It will map from he column in
    # `words` given by `first(order)` to column given by `last(order)`. So if `order == 2 => 1`
    # then dictionary will map from second column to first column.
    dict = Dict(zip(words[2:end, first(order)], words[2:end, last(order)]))
    questions = dict |> keys |> collect |> shuffle
    
    points = 0
    t = time()
    for question in questions
        print("What is "); printstyled(question, color = :light_cyan); print(" in ", b, "? ")
        answer = readline(stdin)
        if answer == dict[question]
            printstyled("Correct!\n", color = :green)
            points += 1            
        else
            printstyled("Wrong", color = :red); print(", it is ")
            printstyled(dict[question], color = :light_cyan)
            println()
        end
        println()
    end
    dt = round(time() - t)
    println("$points/$(length(words))")
    print("Time: "); printstyled(dt, color = :light_cyan)
end