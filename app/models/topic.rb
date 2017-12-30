class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  belongs_to :owner, class_name:'User'
  validates :name, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum:2000 }, presence: true

  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

end
