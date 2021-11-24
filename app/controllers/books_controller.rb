class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:succes] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @new_book = Book.new
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @new_book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @in_user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:succes] = "You have update book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
