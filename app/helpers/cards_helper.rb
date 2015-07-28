module CardsHelper
  def display_data(card)
    "#{card.name} (#{card.type} - Adventure Deck: #{card.number})"
  end
end