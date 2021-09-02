class BooksController < ApplicationController

  def index
    @books = Book.all  #Fetch all Books from database
  end


  def new
    @book = Book.new
    @authors = Author.all
  end

  #========== Create new Book =========== #
  def create
    @book = Book.create(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  #========== Update Book Details =========== #
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  #========== Delete an Book =========== #
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
  #========== Book's Params =========== #
  def book_params
    params.require(:book).permit(:book_title)
  end
end
