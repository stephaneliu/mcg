require 'rails_helper'

RSpec.describe UsersController do
  login_admin

  describe '#index' do
    let!(:user) { create :user }
    before      { get :index }

    it do
      expect(assigns(:users)).to eq(User.assignables)
      expect(assigns(:roles)).to eq(User.assignable_roles)
    end
  end

  describe '#edit' do
    before     { xhr :get, :edit, id: user.id }
    let(:user) { create :user }

    specify { expect(assigns(:user)).to eq(user) }
  end

  describe '#update' do
    before { xhr :put, :update, id: user.id, user: { name: user.name, role: user.role } }
    let(:user) { create :user }

    it do
      expect(assigns(:user)).to eq(user)
      expect(flash[:notice]).to match(/success/)
    end
  end
end
