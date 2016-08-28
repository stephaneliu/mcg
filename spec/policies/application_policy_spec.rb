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

  describe 'for a user' do
    let(:user) { create(:user) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  describe 'for a guard' do
    let(:user) { create(:user, :guard) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  describe 'for a captain' do
    let(:user) { create(:user, :captain) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  describe 'for an advisor' do
    let(:user) { create(:user, :advisor) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  describe 'for an admin' do
    let(:user) { create(:user, :admin) }
    specify    { is_expected.to_not permit(:index) }
    specify    { is_expected.to_not permit(:show) }
    specify    { is_expected.to_not permit(:create) }
    specify    { is_expected.to_not permit(:new) }
    specify    { is_expected.to_not permit(:update) }
    specify    { is_expected.to_not permit(:destroy) }
  end

  describe '#role_at_least_user?' do
    context 'when user role is user' do
      let(:user) { create(:user) }
      specify    { expect(subject.role_at_least_user?).to eq(true) }
    end

    context 'when user role is guard' do
      let(:user) { create(:user, :guard) }
      specify    { expect(subject.role_at_least_user?).to eq(true) }
    end

    context 'when user role is captain' do
      let(:user) { create(:user, :captain) }
      specify    { expect(subject.role_at_least_user?).to eq(true) }
    end

    context 'when user role is advisor' do
      let(:user) { create(:user, :advisor) }
      specify    { expect(subject.role_at_least_user?).to eq(true) }
    end

    context 'when user role is admin' do
      let(:user) { create(:user, :admin) }
      specify    { expect(subject.role_at_least_user?).to eq(true) }
    end
  end

  describe '#role_at_least_guard?' do
    context 'when user role is user' do
      let(:user) { create(:user) }
      specify    { expect(subject.role_at_least_guard?).to eq(false) }
    end

    context 'when user role is guard' do
      let(:user) { create(:user, :guard) }
      specify    { expect(subject.role_at_least_guard?).to eq(true) }
    end

    context 'when user role is captain' do
      let(:user) { create(:user, :captain) }
      specify    { expect(subject.role_at_least_guard?).to eq(true) }
    end

    context 'when user role is advisor' do
      let(:user) { create(:user, :advisor) }
      specify    { expect(subject.role_at_least_guard?).to eq(true) }
    end

    context 'when user role is admin' do
      let(:user) { create(:user, :admin) }
      specify    { expect(subject.role_at_least_guard?).to eq(true) }
    end
  end

  describe '#role_at_least_captain?' do
    context 'when user role is user' do
      let(:user) { create(:user) }
      specify    { expect(subject.role_at_least_captain?).to eq(false) }
    end

    context 'when user role is guard' do
      let(:user) { create(:user, :guard) }
      specify    { expect(subject.role_at_least_captain?).to eq(false) }
    end

    context 'when user role is captain' do
      let(:user) { create(:user, :captain) }
      specify    { expect(subject.role_at_least_captain?).to eq(true) }
    end

    context 'when user role is advisor' do
      let(:user) { create(:user, :advisor) }
      specify    { expect(subject.role_at_least_captain?).to eq(true) }
    end

    context 'when user role is admin' do
      let(:user) { create(:user, :admin) }
      specify    { expect(subject.role_at_least_captain?).to eq(true) }
    end
  end

  describe '#role_at_least_advisor?' do
    context 'when user role is user' do
      let(:user) { create(:user) }
      specify    { expect(subject.role_at_least_advisor?).to eq(false) }
    end

    context 'when user role is guard' do
      let(:user) { create(:user, :guard) }
      specify    { expect(subject.role_at_least_advisor?).to eq(false) }
    end

    context 'when user role is captain' do
      let(:user) { create(:user, :captain) }
      specify    { expect(subject.role_at_least_advisor?).to eq(false) }
    end

    context 'when user role is advisor' do
      let(:user) { create(:user, :advisor) }
      specify    { expect(subject.role_at_least_advisor?).to eq(true) }
    end

    context 'when user role is admin' do
      let(:user) { create(:user, :admin) }
      specify    { expect(subject.role_at_least_advisor?).to eq(true) }
    end
  end
end
