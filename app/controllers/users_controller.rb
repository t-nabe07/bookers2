class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
  end

  def edit
    @user = current_user
    @edit_user = User.find(params[:id])
  end
  
end
