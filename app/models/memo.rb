class Memo < ActiveRecord::Base
  attr_accessible :text, :private, :bg, :user_id
  
  validates :text, :user_id, :presence => true
  
  belongs_to :user
  has_many :hearts
  has_many :users_who_liked, through: :hearts# , 
#            class_name: "User", foreign_id: "user_id"
end
