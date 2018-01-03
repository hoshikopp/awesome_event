class PostsController < ApplicationController
  before_action :authenticate

  def new
    raise ActionController::RoutingError,'ログイン状態で PostsController#new にアクセス'
  end

  def create
    @topic = Topic.find(params[:post][:topic_id])
    @post = Post.new(params[:post].permit(:id,:comment,:user_name,:topic_id))
    @post.save
    redirect_to topic_path @topic
  end
end
