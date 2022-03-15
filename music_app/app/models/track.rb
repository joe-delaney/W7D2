class Track < ApplicationRecord
  validates :album_id, :title, :ord, :regular?, presence:true 
  validates :regular?, inclusion: %w(true false)

  belongs_to :album,
    foreign_key: :album_id,
    class_name: :Album
end
