class AddRelationsTable < ActiveRecord::Migration 
 def up
 	unless column_exists? :payrolls, :company_id
	  	add_column :users , :company_id , :integer
	  	add_column :employees, :company_id , :integer
	  	add_column :payrolls , :company_id , :integer
	  	change_column_default :companies, :Company_account_no_usd, 0
	 end
  end

  def down
  end
end
