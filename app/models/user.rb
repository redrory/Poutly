class User < ActiveRecord::Base

attr_accessible :company, :email, :name, :password, :password_confirmation
has_secure_password
has_many :clients, dependent: :destroy

before_save {|user| user.email = email.downcase}
before_save :create_remember_token
before_create { generate_token(:auth_token) }

validates :name, presence: true, length: { maximum: 35}

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 50}, format: {with: VALID_EMAIL_REGEX},
											uniqueness: {case_sensitive: false}
validates :company, presence: true, length: { maximum: 50}

validates :password, presence: true, length: { minimum: 6}

validates :password_confirmation, presence: true

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  def feed
    Client.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
      
    end
end
