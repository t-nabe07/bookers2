class BooksController < ApplicationController
  
  def create
  end
  
  def index
    @new_book = Book.new
    @user = current_user
  
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
