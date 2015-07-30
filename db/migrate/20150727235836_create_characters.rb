class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :weapons_count,   default: 0, null: false
      t.integer :spells_count,    default: 0, null: false
      t.integer :armors_count,    default: 0, null: false
      t.integer :items_count,     default: 0, null: false
      t.integer :allies_count,     default: 0, null: false
      t.integer :blessings_count, default: 0, null: false
      t.string  :name

      t.timestamps null: false
    end
  end
end
