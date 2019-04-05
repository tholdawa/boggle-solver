Boggle Sovler
============

This is an implemetation of an algorithm to find all the valid words in a given 2-dimensional grid of letters,
as in the popular game Boggle.


Usage
=====
This is an interactive program. It prompts for user input of the board (lines of characters, of the same length),
and then traverses the board and generates the words from the board that are valid according to a dictionary of words.
The dictionary is based on the mac os x words file, filtered to words of length 4 or greater.

```
Timothys-MacBook-Pro:boggle tim$ bin/boggle.rb
Enter the board followed by EOF (ctrl-d)
foo
bar
baz
^D
loading dictionary
loaded dictionary
building board
f o o
b a r
b a z
generating words
baar
baba
baboo
bara
boar
boor
bora
boro
faro
fora
roof
```
