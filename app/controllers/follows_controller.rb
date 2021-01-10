class FollowsController < ApplicationController
  before_action :require_login

  def create
    @target = User.find(params[:id])
    current_user.follow(@target)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @target = User.find(params[:id])
    current_user.unfollow(@target)
    redirect_back(fallback_location: root_path)
  end
end
