# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  token      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Session < ActiveRecord::Base
  validates :token, :user, presence: true
  validates_uniqueness_of :token, scope: :user_id
  
  after_initialize :ensure_session_token
  
  belongs_to :user
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  # Can't just do where(token: token).first.user because after I removed the log in feature
  # I cleared all the sessions from heroku db leaving some users' browsers with a session token
  # but no corresponding user in the db and the site would crash. oops
  def self.find_user_by_session_token(token)
    session = where(token: token).first

    session.nil? ? nil : session.user
  end
  
  private
  def ensure_session_token
    self.token ||= self.class.generate_session_token
  end
end
