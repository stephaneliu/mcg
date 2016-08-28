require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class.new(user, user_record) }

  let(:user_record) { create(:user) }

  context 'for a user' do
    let(:user) { create(:user) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:edit) }
    specify    { is_expected.to_not permit(:update) }
  end

  context 'for a guard' do
    let(:user) { create(:user, :guard) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:edit) }
    specify    { is_expected.to_not permit(:update) }
  end

  context 'for a captain' do
    let(:user) { create(:user, :captain) }
    specify    { is_expected.to permit(:index) }
    specify    { is_expected.to permit(:edit) }
    specify    { is_expected.to permit(:update) }
  end

  context 'for an advisor' do
    let(:user) { create(:user, :advisor) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:edit) }
    specify    { is_expected.to_not permit(:update) }
  end

  context 'for an admin' do
    let(:user) { create(:user, :admin) }
    specify    { is_expected.to permit(:index) }
    specify    { is_expected.to permit(:edit) }
    specify    { is_expected.to permit(:update) }
  end
end
