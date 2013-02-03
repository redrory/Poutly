class User < ActiveRecord::Base
  attr_accessible :company, :email, :name, :password, :password_confirmation

  has_secure_password

  before_save {|user| user.email = email.downcase}

  validates :name, presence: true, length: { maximum: 35}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50}, format: {with: VALID_EMAIL_REGEX},
  											uniqueness: {case_sensitive: false}
  validates :company, presence: true, length: { maximum: 50}

  validates :password, presence: true, length: { minimum: 6}

  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
      
    end
end
