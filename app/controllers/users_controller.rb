class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Successfully Created'
      redirect_to users_path
    else
      flash[:notice] = 'Something went wrong'
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :age, :gender, :password)
  end

end
