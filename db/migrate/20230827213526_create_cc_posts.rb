class CreateCcPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :cc_posts do |t|
      t.string :image
      t.string :title
      t.text :content
      t.references :cc_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
