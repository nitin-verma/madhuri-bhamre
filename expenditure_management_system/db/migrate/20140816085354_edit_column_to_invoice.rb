class EditColumnToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :expense_id, :integer
  end
end
