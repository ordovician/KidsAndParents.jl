export doz, parse_doz

const digit = "0123456789XE"

"""
    doz(x::Integer)
Show integer `x` in dozenal notation. (12 based number)
"""
function doz(x::Integer)
    digits = Int64[]
    while x > 0
        x, y = div(x, 12), rem(x, 12)
        push!(digits, y)
    end
    join(map(d->digit[d+1], reverse(digits)))
end 

"""
    doz(M::Matrix{Int64})
Show matrix `M` in dozenal notation. (12 based number)
"""
function doz(M::Matrix{Int64})
   rows, cols = size(M)
   N = similar(M, String)
   
   for i in 1:rows
       for j in 1:cols
           N[i, j] = doz(M[i, j])
       end
   end
   N
end

"""
    parse_doz(string)
Parse a string containing a dozenal number, producing an integer.
"""
function parse_doz(s::AbstractString)
    digits = Int8[]
    
    for ch in lowercase(s)
        if '0' <= ch <= '9'
           push!(digits, ch - '0')
        elseif 'x' == ch
            push!(digits, 10)
        elseif 'e' == ch
            push!(digits, 11)
        end
    end
    digits = reverse(digits)
    
    x = 0
    for n in 1:length(digits)
        x += digits[n]*12^(n-1)
    end
    x
end
