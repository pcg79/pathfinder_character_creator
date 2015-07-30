class Card < ActiveRecord::Base
  belongs_to :card_type
  belongs_to :adventure_deck

  has_many :card_lists
  has_many :decks, through: :card_lists

  delegate :number, to: :adventure_deck

  scope :weapons,   -> { joins(:card_type).where(["card_types.name = ?", "Weapon"]) }
  scope :spells,    -> { joins(:card_type).where(["card_types.name = ?", "Spell"]) }
  scope :armors,    -> { joins(:card_type).where(["card_types.name = ?", "Armor"]) }
  scope :items,     -> { joins(:card_type).where(["card_types.name = ?", "Item"]) }
  scope :allies,    -> { joins(:card_type).where(["card_types.name = ?", "Ally"]) }
  scope :blessings, -> { joins(:card_type).where(["card_types.name = ?", "Blessing"]) }
  scope :loots,     -> { joins(:card_type).where(["card_types.name = ?", "Loot"]) }

  scope :by_name, -> { order(:name) }

  def type
    card_type.name
  end
end
