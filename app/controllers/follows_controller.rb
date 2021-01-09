class FollowsController < ApplicationController
  def create
    @target = User.find(params[:id])
    current_user.follow(@target)
  end

  def destroy
    @target = User.find(params[:id])
    current_user.unfollow(@target)
  end
end
