class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  include PostsHelper

  def require_login
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
