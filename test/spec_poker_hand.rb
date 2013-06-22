require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ruby-poker.rb'

describe PokerHand, 'Manages entire hand' do
  describe 'Exercise tests' do

    before :each do
      @string_hand = PokerHand.new('2D 9C AS KH AC')
      @squished_string_hand = PokerHand.new('2D9CASKHAC')
      @array_hand = PokerHand.new(%w(2D 9C AS KH AC))
      @verbose_array = PokerHand::OPS
    end

    it 'should create hand from string' do
      @string_hand.must_be_instance_of PokerHand
    end

    it 'should create hand from array' do
      @array_hand.must_be_instance_of PokerHand
    end

    it 'should create the same hand from both string and array' do
      @string_hand.must_equal @squished_string_hand
      @string_hand.must_equal @array_hand
    end

    it 'should not create hand with invalid cards' do
      proc { PokerHand.new('this is not a hand') }.must_raise ArgumentError
      proc { PokerHand.new('91 137 84 13 54') }.must_raise ArgumentError
      proc { PokerHand.new('2B 7H TS KC 3H') }.must_raise ArgumentError
    end

    it 'should have array of verbose hand ratings' do
      @verbose_array.must_be_instance_of Array
      @verbose_array.size.must_equal 10
    end

  end

  describe 'Check hand contents' do
    before :each do
      @two_pair = PokerHand.new('7C 7H AS TD AC')
      @straight = PokerHand.new('6C 7D 8H 9H TC')
      @full_house = PokerHand.new('5S 5C JH 5D JS')
      @flush = PokerHand.new('3H QH 9H JH 2H')
      @royal_flush = PokerHand.new('AS KS QS JS TS')
      @almost_royal_flush = PokerHand.new('AD KD QD JD 9D')
    end

    it 'should return a string of hand with description' do
      @two_pair.to_s.must_equal "7c 7h As Td Ac (Two pair)"
      @flush.to_s.must_equal "3h Qh 9h Jh 2h (Flush)"
    end

    it 'should sort hand by suit' do
      @two_pair.by_suit.just_cards.must_equal 'As 7h Td Ac 7c'
      @straight.by_suit.just_cards.must_equal '9h 8h 7d Tc 6c'
    end

    it 'should sort hand by face value' do
      @two_pair.by_face.just_cards.must_equal "As Ac Td 7h 7c"
      @royal_flush.by_face.just_cards.must_equal "As Ks Qs Js Ts"
    end

    it 'should recognize a flush' do
      @flush.flush?.must_equal [[6, 11, 10, 8, 2, 1], "Qh Jh 9h 3h 2h"]
      @straight.flush?.must_equal false
    end

    it 'should recognize a royal flush' do
      @royal_flush.royal_flush?.must_equal [[10], "As Ks Qs Js Ts"]
    end

    it 'should mock user when royal flush is barely missed' do
      @almost_royal_flush.just_missed_royal_flush?.must_equal true
      @flush.just_missed_royal_flush?.must_equal false
    end

    it 'should mock user when royal flush is hit due to if statement' do
      @royal_flush.just_missed_royal_flush?.must_equal true
    end

    it 'should rate hands properly' do
      @straight.hand_rating.must_equal "Straight"
      @full_house.hand_rating.must_equal "Full house"
    end
  end
end