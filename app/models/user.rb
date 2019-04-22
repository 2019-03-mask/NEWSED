class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :contacts
  has_many :favorites, dependent: :destroy
  has_many :purchase_histories
  has_many :reviews, dependent: :destroy
  has_many :carts, dependent: :destroy

  acts_as_paranoid
end
