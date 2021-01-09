module SessionsHelper
  def current_user
    curid = session[:user_id]
    if !@current_user && curid
      @current_user = User.find_by(id: curid)
    end
    @current_user
  end

  def loggedin?
    !session[:user_id].nil?
  end

  def login(user)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      return true
    end
    flash[:danger] = 'invalid username or password'
    return false
  end

  def logout
    session[:user_id] = nil if loggedin?
    @current_user = nil
  end
end
