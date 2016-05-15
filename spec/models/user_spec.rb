require 'rails_helper'

RSpec.describe User do
  before      { @user = User.new(email: email) }
  let(:email) { 'user@example.com' }

  subject { @user }
  it      { is_expected.to respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match email
  end

  describe '.assignable_roles' do
    subject { described_class.assignable_roles }
    specify do
      is_expected.to_not include('admin')
      is_expected.to include('advisor')
      is_expected.to include('captain')
      is_expected.to include('guard')
      is_expected.to include('user')
    end
  end

  describe '.unassignable_role' do
    subject { described_class.unassignable_role }
    specify { is_expected.to eq('admin') }
  end
end
