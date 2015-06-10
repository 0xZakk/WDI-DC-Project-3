class PlaylistRecord < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :record
end