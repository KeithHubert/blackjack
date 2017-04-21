# hand.rb

require 'pry'
require_relative 'deck'
require_relative 'card'

  class Hand
    def initialize(cards)
      @cards = cards
    end
    # def push_to_hand(new_card)
    #   @cards << new_card
    #
    #   end

    def calculate_hand
      sum = 0

        @cards.each do |card|

        # card.gsub!(/["♦♣♠♥"]/, "")
        if card.face_card?
          sum+= 10
        elsif card.ace_card?
          if sum <= 10
            sum += 11
          else
            sum += 1
          end
        else
          sum += card.rank.to_i
        end
      end
       sum
    end
  end
