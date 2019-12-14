class RemoveStrAuthorFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :author, :string
    add_column :books, :author_id, :integer
  end
end
