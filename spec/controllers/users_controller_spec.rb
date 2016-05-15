require 'rails_helper'

RSpec.describe UsersController do
  describe 'index' do
    login_admin 

    let!(:user) { create :user }
    before      { get :index }

    it do
      expect(subject.current_user).to_not be_nil
      # Login to access resource
      expect(assigns(:users)).to eq(User.all)
    end
  end
end
