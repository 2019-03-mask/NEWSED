class Song < ApplicationRecord

	belongs_to :disc, required: true

end
