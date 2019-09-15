class PreferencesController < ApplicationController
  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)
    @preference.save!
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
    params.require(:preferences).permit(:category, :user)
  end
end
