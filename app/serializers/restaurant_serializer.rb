class RestaurantSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :name, :status, :image  
  
  def image
    object.image.url
  end

  has_many :dishes
end
