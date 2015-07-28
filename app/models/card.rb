class Card < ActiveRecord::Base
  belongs_to :card_type
  belongs_to :adventure_deck

  has_and_belongs_to_many :decks
end
