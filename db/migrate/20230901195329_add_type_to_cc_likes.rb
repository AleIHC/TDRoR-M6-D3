class AddTypeToCcLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :cc_likes, :type, :string
  end
end
