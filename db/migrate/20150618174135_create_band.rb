class CreateBand < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
    end
  end
end
