module SessionsHelper
  def sign_in(user)
    session[:current_user_id] = user.id.to_s
    self.current_user = user    
  end

  def sign_out
    session[:current_user_id] = nil
    self.current_user = nil
  end

  def current_user=(user)
    @_current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    puts "SESSION ID IS"
    p session[:current_user_id]
    @_current_user ||= session[:current_user_id] && Camper.find(session[:current_user_id])

  end
end
