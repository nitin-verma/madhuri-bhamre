class AddFieldsToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :description, :string
    add_column :expenses, :price_per_item, :decimal
    add_column :expenses, :number_of_item, :integer
  end
end
