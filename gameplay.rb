class Hangman

  def initialize
    @letters = ("a".."z").to_a
    @word = words.sample
    @lives = 7
    @correct_guess = []
    @word_teaser = ""

    @word.first.size.times do
      word_teaser += "_ "
    end
  end

  def words
    [
      ["cricket", "A game played by gentlemen"],
      ["jogging", "We are not walking..."],
      ["celebrate", "Remembering special moments"],
      ["continent", "There are 7 of these"],
      ["exotic", "Not from around here..."],
    ]
  end

  def print_teaser
   word_teaser = ""

   puts word_teaser
  end

  def make_guess
    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp

      #if letter is not part of word then remove from the letters array
      good_guess = @word.first.include? guess

      if good_guess
        puts "You are correct!"
        
        @correct_guess << guess
        #remove correct guess from the alphabet
        @letters.delete guess


        print_teaser
        make_guess
      else
        @lives -= 1
        puts "Sorry... you have #{@lives} lives left. try again!"
        make_guess
      end
    else
      puts "Game over! Better luck next time!"
    end
  end

  def begin
    #ask user to start with a letter
    puts "New game started... your word is #{@word.first.size} characters longs"
    print_teaser

    puts "Your clue is #{ @word.last }"

    make_guess

  end

end

game = Hangman.new
game.begin