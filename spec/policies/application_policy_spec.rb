require 'rails_helper'

RSpec.describe ApplicationPolicy do
  subject { described_class.new(user, record) }

  let(:record) { create(:user) }

  describe '#initialize' do
    let(:user) { create(:user) }

    specify do
      expect(subject.user).to eq(user)
      expect(subject.record).to eq(record)
    end
  end

  context 'for a user' do
    let(:user) { create(:user) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  context 'for a guard' do
    let(:user) { create(:user, :guard) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  context 'for a captain' do
    let(:user) { create(:user, :captain) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  context 'for an advisor' do
    let(:user) { create(:user, :advisor) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  context 'for an admin' do
    let(:user) { create(:user, :admin) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end
end
