class Artist < ApplicationRecord

  has_many :items

  attachment :artist_image

  validates :artist_name, presence: true

end
