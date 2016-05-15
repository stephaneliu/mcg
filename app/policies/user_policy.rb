class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.captain?
  end
end
