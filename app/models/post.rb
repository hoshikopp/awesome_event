class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates :comment, length: { maximum:140 },presence:true
end
