class RemoveUesrTypeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :uesr_type, :string
  end
end
