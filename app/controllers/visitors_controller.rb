class VisitorsController < ApplicationController
  layout 'landing'

  def index
    authorize :visitor
  end
end
