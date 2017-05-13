module ApplicationHelper
  def admin_categories_link
    categories_link_tag = "#{link_to 'Categories', categories_path}"
    categories_link_tag.html_safe if current_user_is_admin
  end

  def posts_link
      link_to 'Posts', posts_path
  end

  def current_user_is_admin
    current_user && current_user.is_admin?
  end

  def login_or_logout_user_link
    current_user ? logout_user_link : login_user_link
  end

  def login_user_link
    link_to 'Login', new_user_session_path
  end

  def logout_user_link
    link_to 'Logout', destroy_user_session_path, :method => :delete
  end

  def register_user_link
    link_to 'Register', new_user_registration_path
  end
end
