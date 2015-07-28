class CreateCardLists < ActiveRecord::Migration
  def change
    create_table :card_lists do |t|
      t.references :card, index: true, foreign_key: true
      t.references :deck, index: true, foreign_key: true
    end
  end
end
