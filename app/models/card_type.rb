class CardType < ActiveRecord::Base
  validates_uniqueness_of :name

  VALID_TYPES = %w(Weapon Spell Armor Item Ally Blessing Loot)
end
