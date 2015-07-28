class CreateAdventureDecks < ActiveRecord::Migration
  def change
    create_table :adventure_decks do |t|
      t.string :number, null: false

      t.timestamps null: false
    end
  end
end
