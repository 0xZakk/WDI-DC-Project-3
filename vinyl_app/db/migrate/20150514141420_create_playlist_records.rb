class CreatePlaylistRecords < ActiveRecord::Migration
  def change
    create_table :playlist_records do |t|
      t.belongs_to :playlist, index: true, foreign_key: true
      t.belongs_to :record, index: true, foreign_key: true
    end
  end
end
