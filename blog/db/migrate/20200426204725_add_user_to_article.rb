class AddUserToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user, :integer
  end
end
