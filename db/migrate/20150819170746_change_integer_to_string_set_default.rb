class ChangeIntegerToStringSetDefault < ActiveRecord::Migration
  def up
  	  	change_column_default :users, :company_id, 0
  	  	change_column :payroll_employees , :amount  , :float
  	  	change_column_default :payroll_employees , :amount  , 0
		change_column :companies , :company_code  , :string
		change_column :companies , :Company_account_no  , :string
		change_column :companies , :Company_account_no_usd  , :string
  	  	change_column :employees , :employee_branch_code  , :string
  	  	change_column :employees , :employee_account_no  , :string
  	  	change_column :employees , :employee_debit_credit , :string
  	  	change_column_default :employees , :employee_debit_credit  , 'D'

  	  	


	
  end

  def down
  end
end
