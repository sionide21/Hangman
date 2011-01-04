module Hangman
  class Clue
    # A list of letters in the order you should try them
    # Note that the order may change based on the next letter so the 
    # only signinficant item, in ths list is the first one
    attr_reader :guesses
    # A list of words that could be the solution
    attr_reader :possible_words
    
    # Create a new clue
    # the clue format is a string with underscores for unknown letters
    # Example: "he__o"
    # The wrong letters is a list of letters that were guessed but aren't correct
    def initialize(clue, wrong_letters)
      @clue = clue.to_s.downcase
      @wrong_letters = wrong_letters
      @letter_counts = {}
      @possible_words = []
      @used_letters = @clue.split(//).reject { |c| c == "_" }
    end
    
    # Pass a list of words to this method to come up wth the best next guess
    # It will return true if there are any potential guesses
    # You can call this method multiple times on a single Clue (if you have multiple wordlists this may be helpful)
    def solve(words)
      length = @clue.length
      
      words.each do |w|
        w = w.chomp.downcase
        next if w.size != length
        next if @wrong_letters.any? { |c| w.include? c }

        if match_word w
          @possible_words << w
        end
      end
      @guesses = @letter_counts.sort{ |a,b| b[1] <=> a[1] }.map{ |e| e[0] }
      
      return !@guesses.empty?
    end
    
    private
    
    def match_word(w)
      wcount = {}
      @clue.each_char.with_index do |c, i|
        if c == '_'
          if @used_letters.include? w[i]
            return false
          end
          wcount[w[i]] = 1 # equals instead of += because we want unique per word
        elsif w[i] != c
          return false
        end
      end
      
      @letter_counts.merge! wcount do |k, o, n|
        o + n
      end
      true
    end
  end
end