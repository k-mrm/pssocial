class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper

  helper_method :user, :user?

  private 

  def user
    current_user
  end

  def user?
    loggedin?
  end
end
