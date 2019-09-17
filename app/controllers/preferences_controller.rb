class PreferencesController < ApplicationController
  def index
    @preferences = Preference.all
    @user = current_user
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def new
    @preference = Preference.new
    @user = current_user
  end

  def create
    params[:preference][:category_id].each do | id |
      category = Category.find(id) unless id == ""
      preference = Preference.new(category: category, user: current_user)
      preference.save
    end
    redirect_to root_path
  end


  def edit
    @preference = Preference.find(params[:id])
  end

  def update
  end

  def delete
    @preference = Preference.find(params[:id])
    @preference.delete
  end

  def preference_params
    params.require(:preference).permit(:category, :user)
  end
end
