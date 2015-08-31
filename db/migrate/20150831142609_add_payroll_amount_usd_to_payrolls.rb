class AddPayrollAmountUsdToPayrolls < ActiveRecord::Migration
  def change
  	  	unless column_exists? :payrolls, :payroll_amount_usd
  	  		change_column_default :employees , :employee_debit_credit  , 'C'
			add_column :payrolls, :payroll_amount_usd, :float
  	  	end
  end
end
