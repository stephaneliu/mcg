class PagesController < ApplicationController
  def letsencrypt
    authorize :visitor
    render text: "drxppHtGR401yLkRh5egdQwY5da69InRO5Y.LE46GeuZQg4UJOqQNUCubU_FL_CIojASYkTCj0gVYww"
  end
end
