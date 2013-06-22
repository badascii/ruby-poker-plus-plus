require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ruby-poker.rb'

describe Card, 'Manages single cards' do
    # Sets up test with a variety of different new card inputs
    before :each do
      @card1 = Card.new('9H')
      @card2 = Card.new(2, 14)
      @card3 = Card.new('3', 'C')
      @card4 = Card.new('7D')

      @face_value_hash = Card::FACE_VALUES
    end

    it 'should build a card from a string' do
      @card1.face.must_equal(8)
      @card1.suit.must_equal(2)
    end

    it 'should build a card from integer values' do
      @card2.face.must_equal(1)
      @card2.suit.must_equal(14)
    end

    it 'should have a hash of face values' do
      @face_value_hash.has_key?('A').must_equal true
      @face_value_hash.has_key?('5').must_equal true
      @face_value_hash.has_value?(11).must_equal true
      @face_value_hash.has_value?(3).must_equal true

    end

    it 'should know its position in the deck' do
      @card1.must_respond_to :natural_value
      @card2.must_respond_to :natural_value
      @card3.must_respond_to :natural_value
      @card4.must_respond_to :natural_value
    end
end
