module ControllerMacros
  def login_admin
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = create(:user, :admin)
      admin.confirm
      sign_in admin
    end
  end

  def login_advisor
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:admin]
      advisor = create(:user, :admin)
      advisor.confirm
      sign_in advisor
    end
  end

  def login_captain
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:admin]
      captain = create(:user, :captain)
      captain.confirm
      sign_in captain
    end
  end

  def login_guard
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:admin]
      guard = create(:user, :guard)
      gaurd.confirm
      sign_in guard
    end
  end

  def login_user
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      user.confirm
      sign_in user
    end
  end
end
