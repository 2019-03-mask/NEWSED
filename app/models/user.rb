class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
　has_many :contact
  has_many :favorite, dependent: :destroy
  has_many :purchase_history
  has_many :review, dependent: :destroy
  has_many :cart
end
