class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    render layout: 'homepage'
    # redirect_to places_path
  end

  def profile
    @preferences = Preference.where(user: current_user)
    @user = current_user
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
end
