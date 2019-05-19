class DropArticleCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :article_categories do |t|
      t.integer :article_id, null: false
      t.integer :category_id, null: false
    end
  end
end
