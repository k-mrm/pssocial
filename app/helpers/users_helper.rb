module UsersHelper
  def user_me?(u=@user)
    current_user && u.id == current_user.id
  end
end
