require './contestants.rb'

class Dealer < Contestants
  def initialize(name)
    super(name)
    @display_hand = []
  end

  def show_hand
    @display_hand = @hand.clone
    @display_hand.pop()
    return @display_hand
  end
end