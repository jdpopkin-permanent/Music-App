class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :band_id, index: true
      t.string :live_or_studio

      t.timestamps
    end
  end
end
