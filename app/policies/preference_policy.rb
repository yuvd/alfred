class PreferencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def new?
    user.nil?
  end

  def create
    user.nil?
  end

  def edit
    record.user == user
  end

  
end