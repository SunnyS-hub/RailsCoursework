require 'test_helper'


class BookTest < ActiveSupport::TestCase

  test 'should not save invalid book' do

    book = Book.new

    book.save

    refute book.valid?

  end

  test 'should save valid book' do

    author = Author.new
    author.name = 'JK Rowling'
    author.save
    assert author.valid?
    book = Book.new
    book.name  = 'harry potter'
    book.author_id = 1
    book.description = 'Very good book'
    book.save
    assert book.valid?
  end

  test 'book should save with no description from user' do

    author = Author.new
    author.name = 'JK Rowling'
    author.save
    assert author.valid?
    book = Book.new
    book.name  = 'harry potter'
    book.author_id = 1
    #no description from user
    book.save
    assert book.valid?

  end

  test "should contain 2 books" do
    book = Book.new(name: "test1", author_id: 1, description: "a")
    book1 = Book.new(name: "test2", author_id: 1, description: "b")
    book.save
    book1.save
    bookCount = Book.count
    assert bookCount = 2
  end


end
