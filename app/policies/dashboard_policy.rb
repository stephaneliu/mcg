class DashboardPolicy < ApplicationPolicy
  def show?
    user.admin? || user.advisor? || user.captain? || user.guard?
  end
end
