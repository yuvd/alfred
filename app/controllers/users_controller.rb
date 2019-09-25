class UsersController < ApplicationController



  def show
    @user = params[:id]
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if params[:from] == 'landing'
      redirect_to places_path(category: 'all')
    else
      redirect_to profile_path
    end
  end

def user_params
  params.require(:user).permit(:name, :nickname, :location, :photo, :email)
end

end
