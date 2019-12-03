class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_show(@article)
  end


  private
    def book_params
      params.require(:book).permit(:name, :author,:description)
    end


end
