require './cards.rb'
require './dealer.rb'
require './players.rb'
require './game_play_actions/game_play_actions.rb'

#creates instance of GamePlayActions to have access to game methods
#was wanting to do GamePlayActions as module, but was not getting get_card_value as private method in module working

game = GamePlayActions.new

#creates players

all_contestants = [] # players + dealer
players = []

@dealer = Dealer.new('dealer')

all_contestants.append(@dealer)

players_names = game.get_players

number_of_players = players_names.length + 1 # 1 for dealer

players_names.each do |player_name|
  instance_variable_set("@#{player_name}", Players.new(player_name))
  players.append(instance_variable_get("@#{player_name}"))
end

all_contestants.concat(players)

# creates deck and suffles
current_deck = Cards.new

if number_of_players.between?(1,2)
  current_deck.add_deck(@dealer.name,1)
elsif number_of_players.between?(3,5)
  current_deck.add_deck(@dealer.name,2)
elsif number_of_players.between?(6,8)
  current_deck.add_deck(@dealer.name,3)
else
  current_deck.add_deck(@dealer.name,4)
end


puts '####################'
puts 'deck initial before suffle'
puts current_deck.deck
puts '####################'


current_deck.suffle_cards

puts '####################'
puts 'deck initial length'
puts current_deck.deck.length
puts '####################'


puts '####################'
puts 'deck initial after suffle'
puts current_deck.deck
puts '####################'

abort('deck test')

# #initiat hands for players and updates deck
###################################################
#NEEDS RO CHANGE BECAUSE OF LOCATION#

players_hands = game.initiate_hand(current_deck.deck, all_contestants)

#updates hands with name to keep track of cards and score
players_hands[:players].each do |player|
  player.update_hand(player.hand)
end

puts '####################'
puts 'deck initial length'
puts current_deck.deck.length
puts '####################'

#shows hands

puts '____________________________________________'
puts 'Players starting hands'

all_contestants.each do |player|
  puts player.name
  puts player.show_hand
end

# # get total value of the hands and update them for each player

all_contestants.each do |player|
  # turn into game_play_actions method
  player_hand_total = game.get_player_card_totals(player.hand)
  player.update_player_hand_total(player_hand_total)
  puts '####################'
  puts player.name
  puts player_hand_total
  puts '####################'
end

# #player calls hit and updates hand and deck

# game.players_turns(players,current_deck.deck)

# puts '____________________________________________'
# puts "current scores"

# all_contestants.each do |player|
#   puts "#{player.name}"
#   puts "#{player.player_hand_total}"
# end

# puts '____________________________________________'
# puts "Dealer's full hand"

# puts @dealer.hand

# game.dealers_turn(@dealer, current_deck.deck)

# puts '____________________________________________'
# puts "final scores"

# all_contestants.each do |player|
#   puts "#{player.name}"
#   puts "#{player.player_hand_total}"
# end


# DEALER HIT
# show hidden card
# must hit until is 17 or more

# game.hit(current_deck.deck, @player1)

# puts 'player 1'
# p @player1.show_hand

# puts '****'

# p current_deck.deck
# puts '****'


# DETERMINE WHO WINS ROUND

# WHEN DOES GAME END
# at start of game, chose how many rounds to play



