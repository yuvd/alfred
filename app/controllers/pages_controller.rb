class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
  end

  def profile
    @preferences = Preference.where(user: current_user)
    @user = current_user
  end
end
