class User < ActiveRecord::Base
  # relationships

  # validations
  has_secure_password

  # custom uploaded pic files
  has_attached_file :customdartboard
  validates_attachment_content_type :customdartboard, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] 

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :handle, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, :presence => true
end
