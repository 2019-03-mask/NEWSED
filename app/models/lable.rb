class Lable < ApplicationRecord

  has_many :items

  validates :lable_name, presence: true

end
