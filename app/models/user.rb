class User < ApplicationRecord
  has_secure_password
  attr_accessor :avatar
  before_create { generate_token(:remember_token)}
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: true
  VALID_MOBILE_REGEX = /\A[0-9]{10,13}\z/
  validates :mobile, presence: true, format: { with: VALID_MOBILE_REGEX }, uniqueness: true
  VALID_PASSWORD_REGEX = /\A([a-zA-Z0-9]{8,20})\z/
  validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  # validates :city, presence: true, uniqueness: true
  # validates :intro, presence: true, uniqueness: true
  mount_uploader :avatar, AvatarUploader
  has_many :articles
  has_many :comments

  def generate_token(column)
    begin 
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
