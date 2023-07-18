class DropOrderLists < ActiveRecord::Migration[7.0]
  def change
    drop_table :order_lists
  end
end
