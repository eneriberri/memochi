class Memo < ActiveRecord::Base
  attr_accessible :text, :private, :user_id
  
  validates :text, :user_id, :presence => true
  
  belongs_to :user
end
