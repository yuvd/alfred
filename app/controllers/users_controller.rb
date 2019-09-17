class UsersController < ApplicationController

  def index
    @preferences = Preference.all
    @user = current_user
  end

  def show
    @user = params[:id]
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to profile_path
  end

def user_params
  params.require(:user).permit(:name, :nickname, :location, :photo, :email)
end

end
