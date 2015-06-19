class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :band_id
      t.integer :recording_id
    end
  end
end
