class Addtocolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :dishes, :string
    add_column :bills, :restaurants, :string
    rename_column :bills, :total, :total_amount
  end
end
