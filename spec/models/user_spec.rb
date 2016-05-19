require 'rails_helper'

RSpec.describe User do
  before do
    create(:user, :admin)
    create(:user, :advisor)
    create(:user, :captain)
    create(:user, :guard)
    create(:user)
  end

  let(:email) { 'user@example.com' }
  let(:roles) { User.roles.keys }

  describe 'scopes' do
    describe '.assignables' do
      subject { described_class.assignables.map(&:role) }

      specify do
        is_expected.to_not include('admin')
        is_expected.to include('advisor')
        is_expected.to include('captain')
        is_expected.to include('guard')
        is_expected.to include('user')
      end
    end
  end

  describe '.assignable_roles' do
    subject { described_class.assignable_roles }
    it do
      admin_role, assignable_roles = roles.partition { |role| role == 'admin' }

      is_expected.to_not include admin_role.first

      assignable_roles.each do |role|
        is_expected.to include role
      end
    end
  end

  describe '.unassignable_role' do
    subject { described_class.unassignable_role }
    specify { is_expected.to eq('admin') }
  end
end
