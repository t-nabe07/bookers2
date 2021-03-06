class UsersController < ApplicationController

  def show
    @new_book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
    @user_books = @user.books
    @users = User.all
    #@user = current_user
  end


  def index
    @new_book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      @new_book = Book.new
      @books = Book.all
      @user = User.find(params[:id])
      @user_books = @user.books
      @users = User.all
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:succes] = "You have update user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
