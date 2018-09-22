export parse_roman, roman

const roman_numerals = Dict('I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000)

function optimal_roman(x::Integer, one = 'I', five = 'V', ten = 'X')
    if x <= 3
        one^x
    elseif x > 8
        one^(10-x) * ten 
    elseif x >= 5
        five * one^(x - 5)
    else
       one * five
    end
end

"""
    roman(x::Integer)
Show integer `x` as a roman numeral.
"""
function roman(x::Integer)
    digs = Int64[]  # Digits, avoiding symbol used by Julia
    while x > 0
        x, y = div(x, 10), rem(x, 10)
        push!(digs, y)
    end

    result = String[]
    for (i, x)  in enumerate(digs)
        if x == 0
            continue
        end
        
        if     i == 1
            push!(result, optimal_roman(x))
        elseif i == 2
            push!(result, optimal_roman(x, 'X', 'L', 'C'))
        elseif i == 3
            push!(result, optimal_roman(x, 'C', 'D', 'M'))
        end
    end
    join(reverse(result))
end 

"Parse a string of roman numerals to an integer"
function parse_roman(s::AbstractString)
    s = reverse(uppercase(s))
    values = [roman_numerals[ch] for ch in s]
    x = 0
    for (i, v) in enumerate(values)
        if i > 1 && v < values[i - 1]
            x -= v
        else
            x += v
        end
    end
    x 
end
