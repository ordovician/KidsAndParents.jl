export practice_table, multiplication_table, addition_table

"""
    practice_table(n = 10, operator = *)
Create an arithmetic table. By default this will create a multiplication table.
"""
function practice_table(n = 10, operator = *)
   M = zeros(Int64, n, n)
   for i in 1:n
       for j in 1:n
           M[i, j] = operator(i, j)
       end
   end
   M
end

"Create a table for multiplying numbers up to `n`"
multiplication_table(n = 9) = practice_table(n, *)

"Create a table for adding numbers up to `n`"
addition_table(n = 12) = practice_table(n, +)



