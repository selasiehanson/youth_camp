class SessionsController < ApplicationController
  def new    
  end

  def create
    camper = Camper.find_by(email: params[:session][:email], 
      phone_number: params[:session][:phone_number])

    if camper
      sign_in camper
      redirect_to camper_path
    else
      flash.now[:danger] = 'Invalid Login. Please try again'
      # redirect_to login_url and return
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
