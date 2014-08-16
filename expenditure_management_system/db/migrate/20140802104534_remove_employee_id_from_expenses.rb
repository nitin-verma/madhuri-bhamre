class RemoveEmployeeIdFromExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :employee_id, :integer
  end
end
