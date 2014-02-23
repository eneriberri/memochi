class Heart < ActiveRecord::Base
  attr_accessible :user_id, :memo_id
  
  belongs_to :user
  belongs_to :memo
end
