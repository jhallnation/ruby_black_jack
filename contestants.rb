class Contestants
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = []
    @player_hand_total = 0
    @score = 0
  end

  def hand
    @hand
  end

  def update_hand(hand)
    @hand = hand
  end

  def player_hand_total
    @player_hand_total
  end

  def update_player_hand_total(new_hand_total)
    @player_hand_total = new_hand_total
  end

  def player_score
    @score
  end

end