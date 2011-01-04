Hangman Solver
==============

Given a clue for hangman ("____") try to figure out what letter is most likely to be part of the right answer.

## Usage

The executable, simply called `hangman` expects a clue to get started. This is a word with the unknown letters blanked out with `_`. Any letters you have already guessed that were wrong can be given all stuck together as the second argument.

First try:

    $ hangman ______
	17477 potential words
	Guess: e

Second try:

    $ hangman _____e
	1901 potential words
	Guess: a

If that turned out wrong:

	$ hangman _____e a
	989 potential words
	Guess: i

Wrong again:

    $ hangman _____e ai
    435 potential words
    Guess: o

and so on...