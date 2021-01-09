class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  include PostsHelper

  helper_method :user, :user?

  private 

  def user
    current_user
  end

  def user?
    loggedin?
  end
end
