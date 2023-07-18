class SelectDishForCartSerializer < ActiveModel::Serializer
  attributes :id, :cart_id, :restaurant_id, :dish_id
end
