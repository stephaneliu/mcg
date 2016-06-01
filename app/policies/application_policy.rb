class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user   = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def role_at_least_user?
    user.admin? || user.advisor? || user.captain? || user.guard? || user.user?
  end

  def role_at_least_guard?
    user.admin? || user.advisor? || user.captain? || user.guard?
  end

  def role_at_least_captain?
    user.admin? || user.advisor? || user.captain?
  end

  def role_at_least_advisor?
    user.admin? || user.advisor?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.none
    end
  end
end
