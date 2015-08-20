class DeletePayrollEmployeees < ActiveRecord::Migration
  def up
  	drop_table :payroll_employeees
  end

  def down
  end
end
