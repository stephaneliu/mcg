class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize :dashboard
  end
end
