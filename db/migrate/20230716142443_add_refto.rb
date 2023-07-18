class AddRefto < ActiveRecord::Migration[7.0]
  def change
  	add_reference :order_lists, :select_dish_for_cart, index: false
  end
end
