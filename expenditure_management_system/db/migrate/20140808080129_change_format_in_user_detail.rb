class ChangeFormatInUserDetail < ActiveRecord::Migration
  def change
     add_column :user_details, :date_of_birth, :date
  end
end
