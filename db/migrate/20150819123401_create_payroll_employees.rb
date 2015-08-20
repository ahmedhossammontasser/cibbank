class CreatePayrollEmployees < ActiveRecord::Migration
  def change
    create_table :payroll_employees do |t|
    t.integer :amount
    t.timestamps
    end
  end
end
