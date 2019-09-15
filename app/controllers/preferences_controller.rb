class PreferencesController < ApplicationController
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @preferences = policy_scope(Preference)
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
