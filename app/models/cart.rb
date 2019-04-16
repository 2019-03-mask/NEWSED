class Cart < ApplicationRecord

	belongs_to :user
	belongs_to :item
	has_many :purchase_histories
	has_one :delivery, dependent: :delete

end
