class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :findByID, only: [:show, :edit, :update, :delete]
private
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
    @author = Author.all
    @allBooks = Book.all
  end

  def create
    @book = Book.new(params_hash)
    if @book.save
      flash[:success] = "The book was successfully added to your collection"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def show
    @author = Author.all
  end

  def edit

  end

  def update
    if @book.update(params_hash)
      flash[:success] = "The book information was successfully updated"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book= Book.find(params[:id])
    if @book.present?
        @book.destroy
    end
    flash[:danger] = "Book successfully removed from your collection"
    redirect_to books_path
  end


end
