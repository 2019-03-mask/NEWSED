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

  validates :e_mail, presence: true
  validates :password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  acts_as_paranoid
end
