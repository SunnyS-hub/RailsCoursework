require 'test_helper'

class BookControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    author = Author.new
    author.name = 'JK Rowling'
    author.save
    @book = Book.create(name: "Name",author_id: 1, description: "hello" )
    @user = User.create(email: "me@email.com", password: "password", admin: true)
    sign_in @user
  end


  test "should get book index" do
    get books_path

    assert_response :success
  end

  test "should get new" do

    get new_book_path
    assert_response :success
  end

  test "should get edit" do

    get edit_book_path(@book)
    assert_response :success
  end

  test "should get update" do

    get book_path(@book)
    assert_response :success
  end


  test "should get book show" do
    get(books_path(@book))

    assert_response :success
  end
end
