require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/ruby-poker.rb'

describe PokerHand, 'Manages entire hand' do
  describe 'Exercise tests' do

    before :each do
      @string_hand = PokerHand.new('2D 9C AS KH AC')
      @array_hand = PokerHand.new(%w(2D 9C AS KH AC))
    end

    it 'should create hand from string' do
      @string_hand.must_be_instance_of(PokerHand)

    end

    it 'should create hand from array'

    it 'should create the same hand from both string and array' do
      @string_hand.must_equal @array_hand
    end

    it 'should sort by suit'

    it 'should not create hand with invalid cards' do
      proc { PokerHand.new('2B 7H TS KC 3H') }.must_raise ArgumentError
    end

    it 'should have array of verbose hand ratings' do
      PokerHand::OPS.size.must_equal 10
    end

    it 'should return string of entire hand' do
      @array_hand.to_s.must_equal "2d 9c As Kh Ac (Pair)"
    end
  end

  describe 'Check to see if specific hands are recognized' do
    before :each do
      @flush = PokerHand.new('3H QH 9H JH 2H')
      @straight = PokerHand.new('6C 7D 8H 9H TC')
      @two_pair = PokerHand.new('7C 7H AS TD ')
      @just_missed = PokerHand.new('AD KD QD JD 9D')
    end

    it 'should recognize a flush' do
      @flush.flush?.must_equal [[6, 11, 10, 8, 2, 1], "Qh Jh 9h 3h 2h"]
      @straight.flush?.must_equal false
    end

    it 'should mock user when royal flush is barely missed' do
      @just_missed.just_missed_royal_flush?.must_equal true
    end
  end
end