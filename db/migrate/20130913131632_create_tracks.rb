class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, index: true
      t.text :lyrics
      t.string :regular_or_bonus, null: false

      t.timestamps
    end
  end
end
