class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password]) then
      session[:user_id] = user.id
      redirect_to root_url
    end
  end
end
