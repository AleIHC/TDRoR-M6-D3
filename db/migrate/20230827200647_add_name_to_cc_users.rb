class AddNameToCcUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :cc_users, :name, :string
  end
end
