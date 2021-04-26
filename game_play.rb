require './cards.rb'
require './dealer.rb'
require './players.rb'
require './game_play_actions/game_play_actions.rb'

#creates instance of GamePlayActions to have access to game methods
game = GamePlayActions.new

all_contestants = [] # players + dealer
players = []
number_of_players = 0

# players_names = game.get_players
until number_of_players > 0 && number_of_players <= 11
  begin
    puts "How many players? Please enter a number between 1-10 or 0 to exit!"
    number_of_players = Integer(gets.chomp) + 1 # to include dealer

    if number_of_players == 1
      abort("Have a great day!")
    end

  rescue ArgumentError
    retry
  end
end

#getting and creating players
players = game.get_players(number_of_players - 1)
dealer = Dealer.new('DEALER', 0)

all_contestants.append(dealer)
all_contestants.concat(players)

# creates deck and suffles
current_deck = Cards.new

if number_of_players.between?(1,2)
  current_deck.add_deck(1)
elsif number_of_players.between?(3,5)
  current_deck.add_deck(2)
elsif number_of_players.between?(6,8)
  current_deck.add_deck(3)
else
  current_deck.add_deck(4)
end

current_deck.suffle_cards

puts '####################'
counter = 0
current_deck.deck.each do |card|
  if card[:location] == 0
    counter += 1
  end
end
puts "cards in dealer's hand"
puts counter
puts '####################'

abort('current refactor location')

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



