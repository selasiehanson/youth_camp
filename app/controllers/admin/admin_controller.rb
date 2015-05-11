class Admin::AdminController < ApplicationController  
  layout false
  before_filter -> {
    # TODO:
    if (signed_in? && !current_user.is_admin) || !signed_in?
      flash.now[:danger] = "Sorry admin page is for admins only"
      redirect_to root_url
    end
    puts "check if user is admin"
  }

  def index
    render layout: 'admin', nothing: true
  end
end
