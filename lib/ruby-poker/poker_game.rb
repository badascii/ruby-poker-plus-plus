class PokerGame

  attr_accessor :username, :bet

  def initialize(username="Player 1", bet=5)
    @username = username
    @bet = bet
  end

  def self.greeting
    %Q{Welcome to the poker table! Please enter one of the following options:
       'Deal' for the dealer to give you a new hand
       'Bet' to increase your current bet by $5
       'Exit' to leave the table}
  end

  def increase_bet
  end

end