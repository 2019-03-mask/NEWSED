class Item < ApplicationRecord

  belongs_to :artist
  belongs_to :lable
  belongs_to :genre

  has_many :discs, dependent: :destroy
  has_many :favorites
  has_many :reviews
  has_many :carts

  attachment :item_image

  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true


end
