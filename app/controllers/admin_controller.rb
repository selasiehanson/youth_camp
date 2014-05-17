class AdminController < ApplicationController
  before_action -> {
    not current_user.is_admin? 
  }
end
