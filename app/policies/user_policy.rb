class UserPolicy < ApplicationPolicy
  def index?
    admin_or_captain?
  end

  def edit?
    admin_or_captain?
  end

  def update?
    admin_or_captain?
  end

  def admin_or_captain?
    user.admin? || user.captain?
  end
end
