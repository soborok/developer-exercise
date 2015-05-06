require_relative 'blackjack'

def who_is_winner(hand1, hand2)
  if hand1.sum < hand2.sum
    hand2
  elsif hand1.sum > hand2.sum
    hand1
  elsif hand1.sum == hand2.sum
    "PUSH"
  end
end

puts "Shuffling cards..."
puts
sleep 1
round = Deck.new
player_hand = Hand.new()
dealer_hand = Hand.new()

puts "Dealing cards..."
puts
sleep 1
2.times do 
  player_hand.cards << round.deal_card
  dealer_hand.cards << round.deal_card
end

puts "### Board ###"
puts "DEALER: #{dealer_hand.show_dealer_hand_at_dealing}"
puts "PLAYER: #{player_hand.show_play_hand}"

round_ongoing = !dealer_hand.blackjack?

if dealer_hand.blackjack?
  puts
  puts "BLACKJACK!!! Dealer won" 
elsif player_hand.blackjack?
  puts
  puts "You got BLACKJACK!!!"
  round_ongoing = false     # do not set it to false if dealer can push with player's blackjack
end

while round_ongoing
  puts
  puts "Do you want to hit or stay?\n(h for hit, other keys for stay)\n"

  hit_or_stay = gets.chomp
  if hit_or_stay == 'h'
    player_hand.cards << round.deal_card
    puts "PLAYER: #{player_hand.show_play_hand}"

    if player_hand.bust?
      puts
      puts "YOU BUSTED!"
      round_ongoing = false 
    end
  else
    puts "You are staying"
    break
  end
end

if round_ongoing
  puts
  puts "DEALER: #{dealer_hand.show_play_hand}"
end

while round_ongoing
  if dealer_hand.sum < 17
    puts
    puts "Dealer is getting a card"
    sleep 1
    dealer_hand.cards << round.deal_card
    puts "DEALER: #{dealer_hand.show_play_hand}"
  elsif dealer_hand.sum <= 21
    puts
    puts "DEALER: over 17"
    sleep 1

    puts
    case who_is_winner(player_hand, dealer_hand)
    when player_hand
      puts "PLAYER won!"
    when dealer_hand
      puts "Dealer won!"
    else
      puts who_is_winner(player_hand, dealer_hand)
    end

    round_ongoing = false
  elsif dealer_hand.bust?
    puts
    puts "DEALER BUSTED!"
    round_ongoing = false
  end
end