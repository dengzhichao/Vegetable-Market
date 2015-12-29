class VotesController < ApplicationController
  def index
    @merchandises = Merchandise.all
  end

  def vote
  end
end
