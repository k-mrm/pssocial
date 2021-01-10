class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username])

    if login user then
      redirect_to root_path
    else
      redirect_to login_path, alert: 'invalid username or password'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
