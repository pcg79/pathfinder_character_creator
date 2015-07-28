class Deck < ActiveRecord::Base
  belongs_to :character
  belongs_to :player

  has_and_belongs_to_many :cards

  before_create :set_default_card_limits_from_character

  def set_default_card_limits_from_character
    self.weapon_count   = character.weapon_count
    self.spell_count    = character.spell_count
    self.armor_count    = character.armor_count
    self.item_count     = character.item_count
    self.ally_count     = character.ally_count
    self.blessing_count = character.blessing_count
  end
end
