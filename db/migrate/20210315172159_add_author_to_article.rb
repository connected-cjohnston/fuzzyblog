class AddAuthorToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :integer, null: false
    add_foreign_key :articles, :users
  end
end
