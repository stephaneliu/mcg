require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
RSpec.feature 'User delete', :devise, :js do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'user can delete own account' do
    user = FactoryGirl.create(:user)
    user.confirm
    login_as(user, scope: :user)

    visit edit_user_registration_path(user)
    page.accept_confirm { click_button 'Cancel my account' }
    expect(page).to have_content I18n.t 'devise.registrations.destroyed'
  end
end
