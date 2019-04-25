class Review < ApplicationRecord

	belongs_to :user
	belongs_to :item

	validates :review_title, length: { in:1..20}
	validates :review_text, length: { in:1..200}

end
