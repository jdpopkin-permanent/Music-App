class User < ActiveRecord::Base
  attr_accessible :email, :session_token, :password, :admin, :active

  validates :email, :session_token, presence: true
  validates :admin, :active, inclusion: {in: [true, false] }
  before_validation :ensure_session_token #, :ensure_statuses

  has_many :notes, primary_key: :id, foreign_key: :user_id,
    class_name: "Note", dependent: :destroy

  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.set_statuses # bad. refactor
    self.save!
  end

  def ensure_session_token
    self.session_token || self.reset_session_token!
    true
  end

  def self.find_by_credentials(email_address, password)
    user = User.find_by_email(email_address)
    return nil unless user.is_password?(password)
    user
  end

  def set_statuses
    self.active ||= false
    self.admin ||= false
  end

  # def ensure_statuses
#     if self.active.nil?
#       self.active = false
#     end
#
#     if self.admin.nil?
#       self.admin = false
#     end
#
#     true
#   end
end
