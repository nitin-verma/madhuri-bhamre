class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :role
      t.string :address
      t.string :phone
      t.integer :user_id
      t.timestamps
    end
  end
end
