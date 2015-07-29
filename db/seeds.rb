require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = %w(Pat Ethan)

players.each do |player|
  Player.create name: player
end

card_types = CardType::VALID_TYPES

card_types.each do |type|
  CardType.create name: type
end

adventure_decks = %w(B C 1 2 3 4 5 6)

adventure_decks.each do |deck|
  AdventureDeck.create number: deck
end

characters = %w(Alahazra Damiel Feiya Jirelle Lem Lini Lirianne Merisiel Oloch Ranzak Seltyiel Valeros)

card_limits = {
  # "Alahazra" => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  "Damiel"     => { weapon_count: 1, spell_count: 2, armor_count: 1, item_count: 6, ally_count: 1, blessing_count: 4 },
  # "Feiya"    => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  # "Jirelle"  => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  # "Lem"      => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  # "Lini"     => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  # "Lirianne" => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  # "Merisiel" => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  # "Oloch"    => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  # "Ranzak"   => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: },
  "Seltyiel"   => { weapon_count: 4, spell_count: 4, armor_count: 1, item_count: 1, ally_count: 1, blessing_count: 4 }
  # "Valeros"  => { weapon_count: , spell_count: , armor_count: , item_count: , ally_count: , blessing_count: }
}

characters.each do |character|
  limits = card_limits[character]
  Character.new(name: character).tap do |char|
    if limits
      char.weapon_count = limits[:weapon_count]
      char.spell_count  = limits[:spell_count]
      char.armor_count  = limits[:armor_count]
      char.item_count   = limits[:item_count]
      char.ally_count   = limits[:ally_count]
      char.blessing_count = limits[:blessing_count]
    end

     char.save!
   end
end

CSV.foreach('./db/PACG_SS_cards.csv', headers: true) do |line|
  name = line['Name']
  set  = line['Set']
  type = line['Type']

  deck = AdventureDeck.find_or_create_by number: set
  card_type = CardType.find_or_create_by name: type

  Card.find_or_create_by name: name, card_type: card_type, adventure_deck: deck
end
