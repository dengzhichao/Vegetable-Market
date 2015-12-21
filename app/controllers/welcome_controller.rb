class WelcomeController < ApplicationController
  include ApplicationHelper
  
  def index
    if current_user
      redirect_to :user_root
      return
    end
  end
  
  def staff_entry
    authenticate_user!
    if current_user
      redirect_to :user_root
    else
      redirect_to :root
    end
  end
end

def master_menu
  allow_to_admin_user_only
end
