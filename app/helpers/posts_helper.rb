module PostsHelper
  def mypost?
    @post.user_id == current_user.id
  end
end
