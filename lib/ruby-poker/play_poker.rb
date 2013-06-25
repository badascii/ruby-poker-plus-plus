class PlayPoker

  def initialize

  end

  def self.start
    puts "Betting is closed!"
    puts "Dealing hands..."
  end

  def random_hand
    rand_hand = []
    rand_hand << rand(13) + 1
    rand_hand << (PlayPoker.random_card)
    rand_hand << (PlayPoker.random_card)
    rand_hand << (PlayPoker.random_card)
    rand_hand << (PlayPoker.random_card)
    PokerHand.new(rand_hand)
  end
end

puts PlayPoker.random_hand