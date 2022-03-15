class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null:false
      t.string :title, null:false
      t.integer :ord, null:false
      t.text :lyrics
      t.string :regular?, null:false, default: "true"

      t.timestamps
    end
    add_index :tracks, :album_id
  end
end
