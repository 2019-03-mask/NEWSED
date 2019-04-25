class Song < ApplicationRecord

	belongs_to :disc, required: true

	validates :song_title, presence: true

end
