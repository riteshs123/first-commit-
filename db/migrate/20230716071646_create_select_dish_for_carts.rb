class CreateSelectDishForCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :select_dish_for_carts do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
