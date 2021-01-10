class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  include PostsHelper

  def require_login
    if !user?
      redirect_to login_path
    end
  end

  def render_404
    render template: "errors/404"
  end

  helper_method :user, :user?

  private 

  def user
    current_user
  end

  def user?
    !current_user.nil?
  end
end
