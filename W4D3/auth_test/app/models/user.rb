# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  inclue BCrypt

  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true
  validates :password_digest, presence: { message: 'Password can''t be blank' }

  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
  end

  def self.find_by_credentials(username, password)
    check_user = User.find_by(username: username)
    if BCrypt::Password.new(user.password_digest).is_password?(password)
      check_user
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom:urlsafe_base64(16)
  end

  def reset_session_token!

  end

  def ensure_session_token
    @Pa
  end

end
