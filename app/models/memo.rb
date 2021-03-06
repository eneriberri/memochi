class Memo < ActiveRecord::Base
  attr_accessible :body, :private, :bg, :user_id, :tag_list
  
  validates :body, :user_id, :presence => true
  
  acts_as_taggable_on :tags
  
  belongs_to :user
  has_many :hearts
  # has_many :users_who_liked, through: :hearts, source: :user
end
