class PurchaseHistory < ApplicationRecord

	belongs_to :user, optional: true
	has_one :cart
    
end
