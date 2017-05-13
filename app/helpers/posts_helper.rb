module PostsHelper
  def post_owner(post)
    post.user_id == current_user.id && current_user
  end
end
