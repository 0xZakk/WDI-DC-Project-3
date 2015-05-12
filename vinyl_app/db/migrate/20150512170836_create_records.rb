class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :album_name
      t.string :artist_name
      t.string :artist_id
      t.string :release_year
      t.string :image_large
      t.string :image_medium
      t.string :image_small
    end
  end
end
