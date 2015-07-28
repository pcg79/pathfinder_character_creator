class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.references :card_type, index: true, foreign_key: true, null: false
      t.references :adventure_deck, index: true, foreign_key: true, null: false
      t.text :text

      t.timestamps null: false
    end
  end
end
