class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.integer :company_code
      t.integer :Company_account_no
      t.integer :Company_account_no_usd

      t.timestamps
    end
  end
end
