class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  attr_reader :password
  
  before_validation :reset_session_token
  
  validates :email, :password_digest, :session_token, :presence => true
  validates :password, :length => {:minimum => 6, :allow_nil => true}
  validates :email, :username, :uniqueness => true
  
  has_many :memos
  has_many :hearts
  has_many :memos_liked, through: :hearts
           # class_name: "Memo", foreign_id: "memo_id"
  
  def self.find_by_credentials(options)
    user = User.find_by_email(options[:email])
    return user if user && user.is_password?(options[:password])
    nil
  end
  
  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
  
  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
  
  def reset_session_token!
    reset_session_token
    self.save!
    self.session_token
  end
  
  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
  end
  
  
end
