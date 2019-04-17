class Item < ApplicationRecord

  belongs_to :artist
  belongs_to :lable
  belongs_to :genre

  has_many :discs, dependent: :destroy
  has_many :favorites
  has_many :reviews
  has_many :carts

  attachment :item_image

end
