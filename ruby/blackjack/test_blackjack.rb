require_relative 'blackjack'
require 'test/unit'

class CardTest < Test::Unit::TestCase
  def setup
    @card = Card.new(:hearts, :ten, 10)
  end
  
  def test_card_suite_is_correct
    assert_equal @card.suite, :hearts
  end

  def test_card_name_is_correct
    assert_equal @card.name, :ten
  end
  def test_card_value_is_correct
    assert_equal @card.value, 10
  end
end

class DeckTest < Test::Unit::TestCase
  def setup
    @deck = Deck.new
  end
  
  def test_new_deck_has_52_playable_cards
    assert_equal @deck.playable_cards.size, 52
  end
  
  def test_dealt_card_should_not_be_included_in_playable_cards
    card = @deck.deal_card
    assert(!@deck.playable_cards.include?(card))
  end

  def test_shuffled_deck_has_52_playable_cards
    @deck.shuffle
    assert_equal @deck.playable_cards.size, 52
  end
end

class HandTest < Test::Unit::TestCase
  def setup
    @hand = Hand.new
    @hand.cards = [Card.new(:spades, :eight, 8), Card.new(:hearts, :ace, [11, 1])]
  end

  def test_show_play_hand
    assert_equal "spades eight, hearts ace", @hand.show_play_hand
  end

  def test_show_dealer_hand_at_dealing
    assert_equal "##### ###, hearts ace", @hand.show_dealer_hand_at_dealing
  end

  def test_sum_of_hand_should_be_19
    assert_equal @hand.sum, 19
  end

  def test_hand_should_not_be_blackjack
    assert !@hand.blackjack?
  end

  def test_hand_should_not_bust
    assert !@hand.bust?
  end
end