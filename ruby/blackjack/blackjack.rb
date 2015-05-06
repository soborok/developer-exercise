class Card
  attr_accessor :suite, :name, :value

  def initialize(suite, name, value)
    @suite, @name, @value = suite, name, value
  end
end

class Deck
  attr_accessor :playable_cards
  SUITES = [:hearts, :diamonds, :spades, :clubs]
  NAME_VALUES = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10,
    :ace   => [11, 1]}

  def initialize
    shuffle
  end

  def deal_card
    random = rand(@playable_cards.size)
    @playable_cards.delete_at(random)
  end

  def shuffle
    @playable_cards = []
    SUITES.each do |suite|
      NAME_VALUES.each do |name, value|
        @playable_cards << Card.new(suite, name, value)
      end
    end
  end
end

class Hand
  attr_accessor :cards

  def initialize()
    @cards = []
  end

  def show_play_hand
    cards.map { |card| "#{card.suite} #{card.name}" }.join(', ')
  end

  def show_dealer_hand_at_dealing
    "##### ###, #{cards[1].suite} #{cards[1].name}"
  end

  def sum
    sum = cards.map do |card| 
      card.name == :ace ? card.value[0] : card.value 
    end.inject(:+)
    
    if sum > 21 && cards.map { |card| card.name }.include?(:ace)
      sum -= 10
    end
    
    sum
  end

  def blackjack?
    sum == 21 ? true : false
  end

  def bust?
    sum > 21 ? true : false
  end
end

