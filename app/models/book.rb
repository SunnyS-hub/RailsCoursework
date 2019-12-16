class Book < ApplicationRecord

  #book belongs to an author
  belongs_to :author
  #book belongs to user also
  belongs_to :user
  #validate name of the book is present
  validates :name, presence: true

  #check books where user_id is the id of the user that is signed in
  scope :user_books, ->(user){where(['user_id = ?', user.id])}

  #Sql patern search for name of the book
    #if found the return the book
     # else return all books in users collection
  def self.Search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
