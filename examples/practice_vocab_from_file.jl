using DelimitedFiles
using KidsAndParents

words = DelimitedFiles.readdlm("wordlist.txt", '\t', String)

vocab_practice(words)