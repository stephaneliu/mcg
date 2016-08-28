require 'spec_helper'

RSpec.describe VisitorPolicy do
  subject { described_class.new(user, :visotor) }

  context 'for a user' do
    let(:user) { create(:user) }
    specify    { is_expected.to permit(:index) }
  end

  context 'for a guard' do
    let(:user) { create(:user, :guard) }
    specify    { is_expected.to permit(:index) }
  end

  context 'for a captain' do
    let(:user) { create(:user, :captain) }
    specify    { is_expected.to permit(:index) }
  end

  context 'for an advisor' do
    let(:user) { create(:user, :advisor) }
    specify    { is_expected.to permit(:index) }
  end

  context 'for an admin' do
    let(:user) { create(:user, :admin) }
    specify    { is_expected.to permit(:index) }
  end
end
