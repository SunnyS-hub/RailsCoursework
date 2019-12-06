class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @allBooks = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "The book was successfully added to your collection"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "The book information was successfully updated"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end


  private
    def book_params
      params.require(:book).permit(:name, :author,:description)
    end


end
