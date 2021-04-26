require './contestants.rb'

class Players < Contestants
  def initialize(name, id)
    super(name, id)
    #probably removed this
    @all_players = []
  end

  def show_hand
    @hand
  end

  #probably removed this
  def add_players(player)
    @all_players.append(player)
  end

  #probably removed this
  def all_players
    @all_players
  end

end