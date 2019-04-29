class BooksController < ApplicationController
  def top
  end

  def index
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.save
    redirect_to book_path(@new_book)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@new_book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_params
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
