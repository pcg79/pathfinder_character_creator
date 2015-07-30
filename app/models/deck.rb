class Deck < ActiveRecord::Base
  belongs_to :character
  belongs_to :player

  has_many :card_lists
  has_many :cards, through: :card_lists

  before_create :set_default_card_limits_from_character

  def set_default_card_limits_from_character
    self.weapons_count   = character.weapons_count
    self.spells_count    = character.spells_count
    self.armors_count    = character.armors_count
    self.items_count     = character.items_count
    self.allies_count    = character.allies_count
    self.blessings_count = character.blessings_count
  end
end
