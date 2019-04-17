class Artist < ApplicationRecord

  has_many :items

  attachment :artist_image

end
