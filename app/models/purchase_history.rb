class PurchaseHistory < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :cart, optional: true
	belongs_to :delivery, optional: true
end
