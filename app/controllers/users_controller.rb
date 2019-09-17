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
    authoriye @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
  end

def user_params
  params.require(:user).permit(:name, :nickname, :location, :photo, :email)
end

end
