class WelcomeController < ApplicationController
  def index
    @events = Event.where('start_time > ?',Time.zone.now).order(:start_time)
    @topics = Topic
                .eager_load(:posts)
                .all.order("posts.created_at desc")
  end
end
