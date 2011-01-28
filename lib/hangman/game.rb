module Hangman
  class Game
    # The word to guess
    attr_reader :word
    # A list of wrong characters guessed
    attr_reader :wrong
    # A list of correct characters guessed
    attr_reader :correct
    # The number of incorrect guesses
    attr_reader :wrong_guesses

    # Set the word this puzzle wil be for
    def initialize(word)
      @word = word
      @wrong = []
      @correct = []
      @wrong_guesses = 0
    end

    # Guess a letter for the puzzle
    def guess(c)
      c = c.to_s.chr.upcase
      if @word.upcase.include? c
        if not @correct.include? c
          @correct << c
        end
        true
      else
        if not @wrong.include? c
          @wrong << c
          @wrong_guesses += 1
        end
        false
      end
    end

    # Whether or not the puzzle is completed
    def solved?
      @word.upcase.each_char.all? { |c| @correct.include? c }
    end

    # The word with only the correct guesses given. Others will be shown as '_'
    def to_s
      # There is probably a better way to do this...
      @word.upcase.each_char.map { |c| @correct.include?(c) ? c : '_' }.join
    end
  end
end