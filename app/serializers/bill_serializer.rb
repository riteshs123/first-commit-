class BillSerializer < ActiveModel::Serializer
  attributes :id, :user, :dishes, :restaurants, :total_amount, :cart_id
end
