require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

# Your code here...

deck = Deck.new
player_cards = deck.deal(2)
dealer_cards = deck.deal(2)

player_hand = Hand.new(player_cards)
dealer_hand = Hand.new(dealer_cards)

puts "Player cards are #{player_cards[0].rank}#{player_cards[0].suit} #{player_cards[1].rank}#{player_cards[1].suit}"

puts "Dealer shows a #{dealer_cards[0].rank}#{dealer_cards[0].suit}"
while player_hand.calculate_hand < 21
  puts "Would you like to hit"
  answer = gets.chomp
  if answer == "y"
    new_card = deck.deal(1)
    puts "Player draws a #{new_card[0].rank}#{new_card[0].suit}"
    player_cards += new_card
    player_hand = Hand.new(player_cards)
    if player_hand.calculate_hand > 21
       break
    end
    else
      break

    end
  end

  while dealer_hand.calculate_hand < 17
      new_card = deck.deal(1)
      puts "Dealer draws a #{new_card[0].rank}#{new_card[0].suit}"
      dealer_cards += new_card
      dealer_hand = Hand.new(dealer_cards)
  end

  if player_hand.calculate_hand > dealer_hand.calculate_hand && player_hand.calculate_hand < 22
    print "Dealer shows a "
    dealer_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    print "Player shows a "
    player_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts "Player Wins"
  elsif dealer_hand.calculate_hand > player_hand.calculate_hand && dealer_hand.calculate_hand < 22
    print "Player shows a "
    player_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    print "Dealer wins with a "
    dealer_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
  elsif dealer_hand.calculate_hand > 22
    print "Dealer shows a "
    dealer_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    print "Player shows a "
    player_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    puts "Dealer Busts! Player Wins"
  elsif player_hand.calculate_hand > 22
    print "Dealer shows a "
    dealer_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    print "Player shows a "
    player_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    puts "Player Busts! Dealer Wins"
  else
    print "Dealer shows a "
    dealer_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    print "Player shows a "
    player_cards.each do |card|
      print "#{card.rank}#{card.suit} "
    end
    puts ""
    puts "It's a push!"
  end
