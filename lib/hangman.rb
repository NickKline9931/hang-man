puts "Hang, man."


class Game

    def initialize
        @choice = []
        @guessed = []
        @correct_letters = []
    end
    def select_word
        contents = File.readlines('words.text').sort
        
        contents.each do |str|
            if str.length >= 5 && str.length <= 12
                @choice << str
            end
        end
        $word = @choice.sample
        puts $word
    end
    def hide_solution
        $solution = $word.chomp.split(//)
        $correct_letters = []
        $solution.each { $correct_letters << '_'}
        p $correct_letters
end

def input
    puts "Guess a letter."
    letter_select = gets.chomp
    $guess = letter_select.downcase
    
    if $guess.match?(/[[:alpha:]]/) == false
        puts "Letters only!"
    elsif $guess.length > 1
        puts "Only one letter at a time!"
end
check_guess
reveal_letters
show_guessed($guess)
end
    def check_guess
        if $word.include?($guess)
            puts "Correct!"
       else
        puts "Wrong!"
       end
       end
    
       def turns
        $i = 0
        until $i == $word.length + 1 || $correct_letters == $word.chomp.split(//) do
            input
            if $guess.match?(/[[:alpha:]]/) && $guess.length == 1
                $i += 1
                puts "Guesses Taken: #{$i}/#{$word.length + 1}"
                end_message
            end
        end
        if $i == 6
        puts "Game Over"
    end
    end

    def end_message
        if $correct_letters == $word.chomp.split(//)
            puts "You Win!"
        elsif
            $i == $word.length + 1 && $correct_letters != $word
            puts $word
            puts "You Lose!"
    
    end
    end
    def reveal_letters
        $solution.each_with_index do |item, index|
            $correct_letters[index] = item if $guess.include?(item)
        end
        print $correct_letters
    end

    def show_guessed(char)
        if char.match?(/[[:alpha:]]/)
            @guessed << char
            puts @guessed
end
end
end
new_game = Game.new
new_game.select_word
new_game.hide_solution
new_game.turns