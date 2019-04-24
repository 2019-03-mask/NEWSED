class PurchaseHistory < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :cart, optional: true

end
