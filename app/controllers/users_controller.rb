class UsersController < ApplicationController
skip_before_action :require_login, only: [:new, :create, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_back_or_to root_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_show_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
