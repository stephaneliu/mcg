# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  role                   :integer
#  confirmed_at           :datetime
#  confirmation_token     :string(255)
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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
