class PostsController < ApplicationController
  def index
    @posts = current_user.posts
    # Wyświetla ostatnie 5 postów użytkownika
    # @posts = current_user.posts.last(5)
  end

  def new
    @post = Post.new
  end

  def create
    # Zabezpieczenie przed podmianą id aktualnie zalogowanego użytkownika
    # Uniemożliwia dodanie psotu dla innego użytkownika, niż aktualni zalogowany
    return unless post_params[:user_id] == current_user.id.to_s
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to @post
    else
      flash[:alert] = 'Could  not create post.'
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
     params.require(:post).permit(:title, :description, :expiration_date, :user_id)
  end
end
