class CategoryPolicy
  attr_reader :user, :category

  def initalize(user, category)
    @user = user
    @category = category
  end

  def edit?
    user_is_admin?
  end

  def destroy?
    user_is_admin?
  end

  private

  def user_is_admin?
    user && user.is_admin?
  end
end
