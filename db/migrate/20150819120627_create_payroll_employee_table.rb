class CreatePayrollEmployeeTable < ActiveRecord::Migration
  def up
  	create_table :payroll_employeees do |t|
      t.belongs_to :payroll, index: true
      t.belongs_to :employee, index: true
  	  t.string :amount
      t.timestamps null: false
    end

  end

  def down
  end
end
