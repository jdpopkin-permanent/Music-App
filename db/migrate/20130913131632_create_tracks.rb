class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, index: true
      t.text :lyrics
      t.string :type, null: false

      t.timestamps
    end
  end
end
