class CreateCcLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :cc_likes do |t|
      t.string :kind
      t.references :cc_post, foreign_key: true
      t.references :cc_user, null: false, foreign_key: true
      t.references :cc_comment, foreign_key: true

      t.timestamps
    end
  end
end
