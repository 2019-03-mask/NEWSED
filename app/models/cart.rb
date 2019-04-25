class Cart < ApplicationRecord

	belongs_to :user
	belongs_to :item
	has_one :purchase_histories
	has_one :delivery, dependent: :delete

    acts_as_paranoid
end
