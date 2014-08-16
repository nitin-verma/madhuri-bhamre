class AddExplainationToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :explanation, :string
  end
end
