class VotesController < ApplicationController
  include ApplicationHelper
  def index
    @merchandises = Merchandise.all
    @ticket = Ticket.find_by_number(params[:number]) 
    if @ticket.nil? then
      redirect_to votes_login_url 
    end
  end

  def vote
    @ticket = Ticket.find_by_number(params[:ticket])
    @ticket.vote = params[:vegetable_id]
    @ticket.save
    @merchandise = Merchandise.find_by_id(@ticket.vote)
  end
  
  def login
    @vote = Vote.new
  end
  
  def check
    @vote = Vote.new(params[:vote].permit(:number, :security)) 
    @ticket = Ticket.find_by_number(@vote.number)
    if @ticket.nil? then
      redirect_to votes_login_url, :notice=>'Invalid number' 
    else
      if security_code(@vote.number) == @vote.security then 
        redirect_to :controller => 'votes', :action=>'index',
            :number=>@ticket.number
      else
        redirect_to votes_login_url, :notice=>'Invalid Security Code'
      end 
    end
  end
end
