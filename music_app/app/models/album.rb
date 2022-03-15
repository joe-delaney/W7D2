class Album < ApplicationRecord
  validates :band_id, :title, :year, :live?, presence: true

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band
end
