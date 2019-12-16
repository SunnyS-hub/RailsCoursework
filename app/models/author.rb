class Author < ApplicationRecord
  # one author can have many books
  has_many :book
  # validates the name field is not empty
  validates :name, presence: true
end
