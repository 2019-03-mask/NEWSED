class Item < ApplicationRecord

  belongs_to :artist, required: true
  belongs_to :lable, required: true
  belongs_to :genre, required: true

  has_many :discs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :carts

  attachment :item_image

  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :item_name, presence: true
  validates :item_states, presence: true
  validates :item_type, presence: true
  validates :price, presence: true
  validates :stock, presence: true

end
