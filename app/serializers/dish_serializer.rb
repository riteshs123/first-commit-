class DishSerializer < ActiveModel::Serializer
   attributes :id, :category, :restaurant, :name, :price, :image

  def image
    object.image.url
  end
  
end
