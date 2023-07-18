class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_type, :name, :email
end
