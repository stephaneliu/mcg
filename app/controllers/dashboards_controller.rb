class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize :dashboard
    @events = Event.active
  end
end
