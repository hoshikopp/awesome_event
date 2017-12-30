class PostsController < ApplicationController
  before_action :authenticate

  def new
    raise ActionController::RoutingError,'ログイン状態で PostsController#new にアクセス'
  end

  def create
    @post = Post.new(params[:post].permit(:id,:comment))
    @post.save
    redirect_to topic_path
  end
end
