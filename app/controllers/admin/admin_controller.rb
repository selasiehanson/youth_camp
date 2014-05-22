class Admin::AdminController < ApplicationController  

  before_filter -> {
    # TODO:
    puts "check if user is admin"
  }

  def index
    render layout: 'admin', nothing: true
  end
end
