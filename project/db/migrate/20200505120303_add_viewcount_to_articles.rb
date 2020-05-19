class AddViewcountToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :viewcount, :integer
    add_column :articles, :commentcount, :integer
  end
end
