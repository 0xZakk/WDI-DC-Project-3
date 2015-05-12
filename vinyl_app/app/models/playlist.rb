class Playlist < ActiveRecord::Base
  has_many :playlistrecords
  has_many :records, through: :playlistrecords
end