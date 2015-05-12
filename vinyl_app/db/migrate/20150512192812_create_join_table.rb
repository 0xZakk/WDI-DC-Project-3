class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :playlists, :records do |t|
      t.index :playlist_id
      t.index :record_id
    end
  end
end
