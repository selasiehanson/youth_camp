class Admin::AdminController < ApplicationController  
  layout false
  before_filter -> {
    # TODO:
    puts "check if user is admin"
  }

  def index
    render layout: 'admin', nothing: true
  end
end
