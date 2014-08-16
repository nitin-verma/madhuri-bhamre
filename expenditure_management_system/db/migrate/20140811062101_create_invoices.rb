class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :receipt_image
      t.integer :imageable_id
      t.string :imageable_type
    end
  end
end
