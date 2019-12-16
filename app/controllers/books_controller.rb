class BooksController < ApplicationController
#  before_action :authenticate_user!
  #DRY repeating code susing helper method
  before_action :findByID, only: [:show, :edit, :update, :delete]
private
  #white listing params sent (strong parmas)
  def params_hash
    params.require(:book).permit(:name, :author_id,:description)
  end

  def findByID
    @book = Book.find(params[:id])
  end
public
  def new
    @book = Book.new
  end

  def index
    #check if a user is signed in
    if !current_user
      flash[:danger] = "You need to sign in/sign up to add books"
      redirect_to new_user_registration_path
    else
      @author = Author.all
      @allBooks = Book.user_books(current_user)

  end

  #search action for user.
  def search
    #@search = Book.all
  #  render plain: params[:wchBook]
    #user only searches in their collection using scope user_books
    @search = Book.user_books(current_user).Search(params[:wchBook])

  end

  end

  def create
    # create book using white listed params (params_hash)
    @book = Book.new(params_hash)
    #make user id field for book as the id of the current_user
    # signed in before book is saved to db.
    @book.user = current_user
    if @book.save
      flash[:success] = "The book was successfully added to your collection"
      redirect_to book_path(@book)
    else
      #if book cannot be saved then rener the form again
      render 'new'
    end
  end

  def show
    #var passed to view to see which author has created the book
    @author = Author.all
  end

  def edit

  end

  def update
    if @book.update(params_hash)
      flash[:success] = "The book information was successfully updated"
      redirect_to book_path(@book)
    else
      #if book cannot be saved then rener the form again
      render 'edit'
    end
  end

  def destroy
    @book= Book.find(params[:id])
    #if book is present in db the delete
      # else flash and redirect
    if @book.present?
        @book.destroy
    end
    flash[:danger] = "Book successfully removed from your collection"
    redirect_to books_path
  end


end
