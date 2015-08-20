class AddCompanyInfo < ActiveRecord::Migration
  def up
  	unless column_exists? :users, :user_name
	  	add_column :users, :user_name, :string
  	end
  end

  def down
  end
end
