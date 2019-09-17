class UsersController < ApplicationController


 def index
    @preferences = Preference.all
    @user = current_user
  end

  def show
    @user = params[:id]
  end

end
