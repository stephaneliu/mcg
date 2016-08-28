class VisitorPolicy < ApplicationPolicy
  def index?
    true
  end

  def letsencrypt?
    true
  end
end
