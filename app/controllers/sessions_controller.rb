class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new
  end




  def create
    session.delete(:user_id) if session[:user_id] 
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:prev_url] and return

    else
      redirect_to session[:prev_url], notice: 'Invalid login' and return
    end
  end


  def destroy
  
    session.delete(:user_id) if session[:user_id]
    redirect_to session[:prev_url] and return
  end

end
