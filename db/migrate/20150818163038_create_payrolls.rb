class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.integer :payroll_amount

      t.timestamps
    end
  end
end
