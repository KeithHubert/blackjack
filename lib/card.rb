
class Card

  attr_reader :rank, :suit 


  def initialize(rank, suit)
    @suit = suit
    @rank = rank
  end
  def face_card?
   ['J', 'Q', 'K'].include?(@rank)
  end

  def ace_card?
    ['A'].include?(@rank)
  end

end
