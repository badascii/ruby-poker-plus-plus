require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ruby-poker.rb'

describe Card, 'Manages single cards' do
  describe 'Exercise tests' do
    # Sets up test with a variety of different new card inputs
    before :each do
      @card1 = Card.new('9H')
      @card2 = Card.new('3', 'C')
      @card3 = Card.new(2, 14)
      @card4 = Card.new('7D')
    end

    it 'should build card from string' do
      @card1.face.must_equal(8)
      @card1.suit.must_equal(2)
    end
  end
end
