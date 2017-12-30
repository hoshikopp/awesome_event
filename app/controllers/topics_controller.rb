class TopicsController < ApplicationController
  before_action :authenticate, except: :show

  def new
    @topic = current_user.created_topics.build
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(topic_id: params[:id])
    @posts = Post.where(topic_id: params[:id])
    @post = current_user && current_user.posts.find_by(topic_id:params[:id])
  end

  def edit
    @topic = current_user.created_topics.find(params[:id])
  end

  def update
    @topic = current_user.created_topics.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic, notice:'更新しました'
    else
      render:edit
    end
  end

  def destroy
    @topic = current_user.created_topics.find(params[:id])
    @topic.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  def create
    @topic = current_user.created_topics.build(topic_params)
    if @topic.save
      redirect_to @topic, notice:'スレッドを作成しました。'
    else
      @topic = Topic.new(topic_params)
      render "new"
    end
  end

  private
  def topic_params
    params.require(:topic).permit(
      :name, :save_date, :updated_at, :content
    )
  end
end
