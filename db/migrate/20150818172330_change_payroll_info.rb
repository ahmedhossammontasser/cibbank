class ChangePayrollInfo < ActiveRecord::Migration
  def up
  	 change_column :payrolls , :payroll_amount  , :float
  	 change_column :payrolls , :payrolls_no_employees  , :integer

  end

  def down
  end
end
