# Programming for Parents and Children
This is a collection of code intended to for parents and kids. Either to show parents how to write simple programs that children in e.g. elementary school can use to practice arithmetic and spelling.

This code got started when my oldest son started elementary school, and I wanted to help him develop a good sense of how a number system works. To get him to get a sense of numbers I tried to emphasize that a number is not the same as how you write it. I wanted to get across that numbers can be represented in many different ways. So we looked at roman numerals, decimal system, mayan numbers as well as the dozenal system (base 12 numbers).

In here is code for converting to and from dozenal, roman and decimal numbers. There is also code to practice doing multiplication, addition, substraction etc in different number systems. 

## Working with Roman Numerals

After installing the package and using it you can experiment with roman numerals. Here is an example from a Julia REPL session exploring roman numerals using the `roman` and `parse_roman` functions.

    julia> roman(3)
    "III"

    julia> roman(4)
    "IV"

    julia> roman(6)
    "VI"

    julia> roman(12)
    "XII"

    julia> parse_roman("XVI")
    16
    
## Dozenal Number System
The dozenal number system has base 12. That means we count like this: 1, 2, 3, 4, 5, 6, 7, 8, 9, X, E, 10, 11. Here is an example from how to use the dozenal functions in the Julia REPL:

    julia> doz(8)
    "8"

    julia> doz(10)
    "X"

    julia> doz(20)
    "18"

    julia> doz(22)
    "1X"

    julia> doz(12)
    "10"

    julia> doz(11)
    "E"

    julia> parse_doz("100")
    144

    julia> parse_doz("12")
    14

    julia> parse_doz("10")
    12

    julia> parse_doz("X")
    10

    julia> parse_doz("E")
    11

## Vocabulary Training
This program was inspired by some of the first programs I wrote as a teeanger when learning programming. I used it to practice my english vocabulary, and later German vocabulary. It is a simple function `vocab_practice`, which takes a table of words, where each column is in a different language. You define the list like this at the Julia REPL:

    julia> words = [
               "english"  "norwegian";
               "water"    "vann";
               "car"      "bil";
               "house"    "hus";
               "gasoline" "bensin"]
    5×2 Array{String,2}:
     "english"   "norwegian"
     "water"     "vann"     
     "car"       "bil"      
     "house"     "hus"      
     "gasoline"  "bensin"
     
You see this gives us a 2D array or matrix. In this example we got one column of english words and one of column of norwegian words. The first row indicates the name of the languages in each column. You can the practice like this:

    julia> vocab_practice(words)
    What is water in norwegian? vann
    Correct!

    What is car in norwegian? bil
    Correct!

    What is house in norwegian? house
    Wrong, it is hus
    
However you may want to ask questions in reverse order. That is asking about words in the second column. Then you can change the column order:

    julia> vocab_practice(words, order = 2 => 1)
    What is bil in english? car
    Correct!

    What is bensin in english? gasoline
    Correct!
    
So in principle you can have any number of columns in the word list.


## Installation
Upgraded to work with the Julia 1.0 package manager. Get into package mode on the Julia command line using the ']' key.

    pkg> add https://github.com/ordovician/KidsAndParents.jl
    