class PlayPoker

  def self.start
  end

  def self.random_hand
    rand_hand = []
    rand_hand << (PlayPoker.random_card)
    rand_hand << (PlayPoker.random_card)
    rand_hand << (PlayPoker.random_card)
    rand_hand << (PlayPoker.random_card)
    rand_hand << (PlayPoker.random_card)
  end

  def self.random_card
    rand(13) + 1
  end
end

puts PlayPoker.random_hand