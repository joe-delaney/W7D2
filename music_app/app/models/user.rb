class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence:true
  validates :email, :session_token, uniqueness:true
  validates :password, length: {minimum: 6, allow_nil:true}

  before_validation :ensure_session_token

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)

    if @user && @user.is_password?(password)
      @user 
    else
      nil 
    end
  end

  def password
    @password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
end
