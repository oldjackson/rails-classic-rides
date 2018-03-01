class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def dashboard
    if user_signed_in?
      @user = current_user
    else
      redirect_to root_path, notice: "Sign in to see your dashboard!"
    end
    @user = current_user
  end
end
