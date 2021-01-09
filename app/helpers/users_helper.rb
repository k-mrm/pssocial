module UsersHelper
  def user_me?
    @user[:id] == current_user[:id]
  end
end
