class Card < ActiveRecord::Base
  belongs_to :card_type
  belongs_to :adventure_deck

  has_many :card_lists
  has_many :decks, through: :card_lists

  delegate :number, to: :adventure_deck

  def type
    card_type.name
  end
end
