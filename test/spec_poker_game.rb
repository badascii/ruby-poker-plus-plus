require 'minitest/autorun'

describe PokerGame, 'An individual game of poker' do
  before :each do
    @poker_game = PokerGame.new
  end

  it 'should greet the player' do
    PokerGame.greeting.must_be_instance_of String
  end

  it 'should track username of the player' do
    @poker_game.username.must_be_instance_of String
  end

  it 'should allow user to increase bet'

  it 'should deal a random hand'

end