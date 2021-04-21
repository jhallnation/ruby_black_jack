require './contestants.rb'

class Players < Contestants

  def initialize(name)
    super(name)
    @all_players = []
  end

  def show_hand
    @hand
  end

  def add_players(player)
    @all_players.append(player)
  end

  def all_players
    @all_players
  end

end