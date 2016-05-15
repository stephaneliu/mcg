require 'rails_helper'

RSpec.describe User do
  before      { @user = User.new(email: email) }
  let(:email) { 'user@example.com' }

  subject { @user }
  it      { is_expected.to respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match email
  end
end
