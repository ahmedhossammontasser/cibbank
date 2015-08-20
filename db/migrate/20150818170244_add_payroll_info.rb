class AddPayrollInfo < ActiveRecord::Migration
  def up
  	unless column_exists? :payrolls, :payrolls_name
	 add_column :payrolls, :payrolls_creation_date , :datetime
	 add_column :payrolls, :payrolls_value_day , :datetime
  	 add_column :payrolls, :payrolls_no_employees , :float
  	end

  	unless column_exists? :employees, :employee_debit_credit
  	 change_column :employees , :employee_debit_credit  , :string
  	end

  end

  def down
  end
end
