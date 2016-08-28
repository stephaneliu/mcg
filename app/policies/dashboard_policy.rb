class DashboardPolicy < ApplicationPolicy
  def show?
    role_at_least_user?
  end
end
