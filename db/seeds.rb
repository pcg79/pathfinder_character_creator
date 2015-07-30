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
  # "Alahazra" => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  "Damiel"     => { weapons_count: 1, spells_count: 2, armors_count: 1, items_count: 6, allies_count: 1, blessings_count: 4 },
  # "Feiya"    => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  # "Jirelle"  => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  # "Lem"      => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  # "Lini"     => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  # "Lirianne" => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  # "Merisiel" => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  # "Oloch"    => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  # "Ranzak"   => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: },
  "Seltyiel"   => { weapons_count: 4, spells_count: 4, armors_count: 1, items_count: 1, allies_count: 1, blessings_count: 4 }
  # "Valeros"  => { weapons_count: , spells_count: , armors_count: , items_count: , allies_count: , blessings_count: }
}

characters.each do |character|
  limits = card_limits[character]
  Character.new(name: character).tap do |char|
    if limits
      char.weapons_count = limits[:weapons_count]
      char.spells_count  = limits[:spells_count]
      char.armors_count  = limits[:armors_count]
      char.items_count   = limits[:items_count]
      char.allies_count   = limits[:allies_count]
      char.blessings_count = limits[:blessings_count]
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
