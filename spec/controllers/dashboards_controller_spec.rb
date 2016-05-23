require 'rails_helper'

RSpec.describe DashboardsController do
  describe '#show' do
    context 'authentication' do
      it 'is required' do
        expect(get(:show)).to redirect_to new_user_session_path
      end
    end

    context 'assigning events', :pending do
      before       { get(:show) }
      let(:events) { [build_stubbed(:event)] }
      specify      { expect(assigns(:events)).to eq(events) }
    end
  end
end
