class Cart < ApplicationRecord
  belongs_to :user
  has_many :select_dish_for_carts
end
