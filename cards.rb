class Cards
  def initialize
    @deck = []
  end

  def add_deck(dealer,num_of_decks)
    card_id = 0

    num_of_decks.times do 
      # 1 => hearts, 2 => clubs, 3 => spades, 4 => diamonds
      card_suit = [1,2,3,4]
      # 1 => ace, 11 => jack, 12 => queen, 13 => king
      card_values = [1,2,3,4,5,6,7,8,9,10,11,12,13]
      # card_values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

      card_suit.each do |suit|
        card_values.each do |value|
          @deck.push({id: card_id,card_suit: suit, card_value: value, location: dealer})
          card_id += 1
        end
      end
    end
  end

  def deck
    @deck
  end

  def suffle_cards
    @deck = @deck.shuffle 
  end

end