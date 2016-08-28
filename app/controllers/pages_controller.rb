class PagesController < ApplicationController
  def letsencrypt
    authorize :visitor
    render text: "ABf-4A2iIolJIqZooAYNl5_vcoyQuCjbfoUh9IuS5pk.LE46GeuZQg4UJOqQNUCubU_FL_CIojASYkTCj0gVYww"
  end
end
