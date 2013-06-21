require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ruby-poker/poker_hand.rb'

describe PokerHand, 'Manages entire hand' do
  describe 'Exercise tests' do

    before :each do
      @string_hand = PokerHand.new("2D 9C AS AH AC")
      @array_hand = PokerHand.new(%w(8H 9D 3C 9H KS 2H))
    end

    it 'should have method allow_duplicates' do
      @string_hand.must_respond_to(allow_duplicates)
    end

    it 'should create hand from string' do
      @string_hand

    end

    it 'should create hand from array'

    it 'should sort by suit'
  end
end