class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :uesr_type
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end