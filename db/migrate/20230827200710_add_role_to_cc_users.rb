class AddRoleToCcUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :cc_users, :role, :integer
  end
end
