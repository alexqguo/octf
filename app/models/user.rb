# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type            :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password
  
  validates :username, :password_digest, uniqueness: true
  validates :password, length: { minimum: 4, allow_nil: true }
  
  has_many :sessions
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    
    return nil if user.nil?
    
    user.is_password?(password) ? user : nil
  end
  
  def admin?
    self.type == "Admin"
  end
end
