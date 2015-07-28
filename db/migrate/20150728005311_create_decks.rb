class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :character, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.integer :weapon_count
      t.integer :spell_count
      t.integer :armor_count
      t.integer :item_count
      t.integer :ally_count
      t.integer :blessing_count

      t.timestamps null: false
    end
  end
end
