class User < ActiveRecord::Base
  # relationships

  # validations
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :handle, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :location, presence: true, numericality: { only_integer: true }, length: { is: 5 }
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, :presence => true
end
