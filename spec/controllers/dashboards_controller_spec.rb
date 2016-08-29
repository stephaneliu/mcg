require 'rails_helper'

RSpec.describe DashboardsController do
  login_admin

  describe '#show' do
    context 'authentication' do
      # before { sign_out('admin') }
      # it 'is required' do
      #   expect(get(:show)).to redirect_to new_user_session_path
      # end
    end

    context 'assigning events' do
      before { get(:show) }

      let!(:events) do
        [create(:event, starts: 1.hour.from_now), create(:event, starts: 2.hours.from_now)]
      end

      specify { expect(assigns(:events)).to eq(events) }
    end

    context 'sorting events' do
    end
  end
end
