class AddUsersToBooks < ActiveRecord::Migration[5.2]
  def up
    add_reference :books, :user, index:true
    Book.reset_column_information
    user = User.first

    Book.all.each do |book|
      book.user_id = user.id
      book.save
    end

    change_column_null :books, :user_id, false
    add_foreign_key :books, :users
  end


  def down
    remove_foreign_key :books, :users
    remove_reference :books , :user, index:true

  end
end
