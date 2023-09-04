class ChangeCcUserInCcComments < ActiveRecord::Migration[7.0]
  def change
    change_column :cc_comments, :cc_user_id, :integer, null: true
  end
end
