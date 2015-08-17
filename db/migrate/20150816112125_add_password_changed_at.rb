class AddPasswordChangedAt < ActiveRecord::Migration
  def up
      change_table(:users) do |t|
      ## Database authenticatable
		unless column_exists? :users, :password_changed_at

			  t.datetime :password_changed_at
		end
	 end
	add_index :users, :password_changed_at
  end

  def down
  end
end
