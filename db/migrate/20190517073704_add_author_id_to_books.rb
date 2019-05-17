class AddAuthorIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author_id, :integer
    add_column :books, :publisher_id, :integer
  end
end
