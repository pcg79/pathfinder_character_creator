class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :character, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.integer :weapons_count
      t.integer :spells_count
      t.integer :armors_count
      t.integer :items_count
      t.integer :allies_count
      t.integer :blessings_count

      t.timestamps null: false
    end
  end
end
