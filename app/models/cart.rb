class Cart < ApplicationRecord

	belongs_to :user
	belongs_to :item
	has_one :purchase_history

    acts_as_paranoid
end
