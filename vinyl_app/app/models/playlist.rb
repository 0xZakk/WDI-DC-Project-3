class Playlist < ActiveRecord::Base
  has_many :playlistrecords
  has_many :records, through: :playlistrecords
  belongs_to :user

  def self.get_records_in_playlist(playlist)
    array_of_record_objects = []

    playlist_record_relation_array = PlaylistRecord.where("playlist_id = #{playlist.id}")

    playlist_record_relation_array.each do |relation|
      record_object = Record.find(relation.record_id)  
      array_of_record_objects.push(record_object)  
    end  

    return array_of_record_objects
  end

  def self.destory_playlist_and_entries(playlist)
    playlist_entries = PlaylistRecord.where("playlist_id = #{playlist.id}")

    playlist_entries.each do |entry|
      entry.destroy
    end

    playlist.destroy        
  end
end