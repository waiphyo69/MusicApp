class CreateTrack < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :track_type
      t.string :lyrics
    end
  end
end
