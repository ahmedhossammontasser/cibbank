class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.integer :employee_branch_code
      t.integer :employee_account_no
      t.string :employee_currency_code
      t.integer :employee_debit_credit

      t.timestamps
    end
  end
end
