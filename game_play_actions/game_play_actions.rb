class GamePlayActions

  def get_players(number_of_players)
    players = []
    player_names = []

    player_counter = 1
    while number_of_players + 1 > player_counter do 
      puts "Provide name for player #{player_counter}!"
       #stip edge whitespaces and adds underscore for spaces in between words, capitalizes all letters
      player_name = gets.chomp.strip.gsub(/\s+/, "_").upcase

      # limit character length
      if player_name.length > 15
        puts '15 character limit!'
      # make sure names are unique
      elsif player_names.include?(player_name)
        puts 'Name already taken!'
      else
        players.append(Players.new(player_name, player_counter))
        player_names.append(player_name)
        player_counter += 1
      end
    end

    return players
  end

  def initiate_hand(deck,players)
    #change card location
    2.times do 
      players.each do |player|
        player.hand << deck.pop()
      end
    end

    return {deck: deck, players: players}
  end

  def get_player_card_totals(hand)
    player_hand_total = 0
    hand.each do |card|
      player_hand_total += get_card_value(card[:card_value],player_hand_total)
    end
    return player_hand_total
  end

  def players_turns(players, deck)
    players_hits = []

    players.each do |player|
      players_hits.push(player.name)
    end

    until players_hits.length == 0 do
      players.each do |player|
        if players_hits.include?(player.name) 
          puts '____________________________________________'
          hit_response = hit_or_hold(player)

          if hit_response == 'HOLD'
            players_hits.delete(player.name)
          else
            hit(player, deck)
            puts 'Your new hand total:'
            puts player.player_hand_total
            if player.player_hand_total >= 21
              players_hits.delete(player.name)
            end
          end
        end
      end
    end
  end

  def dealers_turn(dealer, deck)

    until dealer.player_hand_total >= 17
      hit(dealer, deck)
    end

    until dealer.player_hand_total >= 21
      puts '____________________________________________'
      hit_response = hit_or_hold(dealer)

      if hit_response == 'HIT'
        hit(dealer, deck)
        puts 'Your new hand total:'
        puts dealer.player_hand_total
      else
        break
      end
    end
  end

  private 

  def get_card_value(card_value, player_hand_total)

    if [*2..10]
      return card_value
    elsif [11,12,13].include?(card_value)
      return 10
    elsif card_value === 1
      if player_hand_total + 11 > 21
        return 1
      else
        return 11
      end
    else
      return 0
    end
  end

  def hit(player,deck)
    player.hand << deck.pop()
    player_hand_total = get_player_card_totals(player.hand)
    player.update_player_hand_total(player_hand_total)
    return {deck: deck, player: player}
  end

  def hit_or_hold(player)
    hit_response = ''
    puts "Hi, #{player.name}, it is your turn!"
    puts ''
    puts 'Your cards are:'
    if player.name == 'dealer'
      puts player.hand
    else
      puts player.show_hand
    end
    puts ''
    puts 'Your current hand total is:'
    puts player.player_hand_total
    puts ''
    puts "would you like to hit? Type hit or hold"
    hit_response = gets.chomp.strip().upcase!
    if hit_response == 'HIT' || hit_response == 'HOLD'
      return hit_response  
    else
      puts ''
      puts "**** INPUT ERROR, please type hit or hold! ****"
      puts ''
      hit_or_hold(player)
    end
  end
end