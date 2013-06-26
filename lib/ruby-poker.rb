require 'ruby-poker/card'
require 'ruby-poker/poker_hand'
require 'ruby-poker/poker_game'


module Start

  def self.game
    PokerGame.greeting

    loop do
      input = gets.downcase.chomp
      if input == 'exit'
        break
      elsif input == 'bet'
        break # TODO
      elsif input == 'deal'
        puts "Dealing hand..."
        hand = PokerHand.random_hand
        puts "Your cards: " + hand
      else
        puts "Please enter a valid input"
      end
    end
  end

end