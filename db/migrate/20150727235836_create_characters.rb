class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :weapon_count,   default: 0, null: false
      t.integer :spell_count,    default: 0, null: false
      t.integer :armor_count,    default: 0, null: false
      t.integer :item_count,     default: 0, null: false
      t.integer :ally_count,     default: 0, null: false
      t.integer :blessing_count, default: 0, null: false
      t.string  :name

      t.timestamps null: false
    end
  end
end
