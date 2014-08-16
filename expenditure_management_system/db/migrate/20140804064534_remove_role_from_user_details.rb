class RemoveRoleFromUserDetails < ActiveRecord::Migration
  def change
    remove_column :user_details, :role, :string
  end
end
