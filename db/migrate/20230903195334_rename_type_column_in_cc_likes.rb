class RenameTypeColumnInCcLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :cc_likes, :type, :like_type
  end
end
