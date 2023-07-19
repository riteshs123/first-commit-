
class SelectDishForCart < ApplicationRecord
  belongs_to :cart
  belongs_to :dish
  belongs_to :restaurant
end
