class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.belongs_to :employee
      t.string :name
      t.string :date
      t.string :status

      t.timestamps
    end
  end
end
