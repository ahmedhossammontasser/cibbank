class AddPayrollEmployeeIds < ActiveRecord::Migration
  def up
	add_column :payroll_employees, :employee_id, :integer
    add_index :payroll_employees, :employee_id
	add_column :payroll_employees, :payroll_id, :integer
    add_index :payroll_employees, :payroll_id
    
  end

  def down
  end
end
