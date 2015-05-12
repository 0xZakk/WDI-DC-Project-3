class Record < ActiveRecord::Base
  has_many :playlistrecords
  has_many :playlists, through: :playlistrecords
end