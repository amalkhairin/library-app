class User < ApplicationRecord
  belongs_to :role
  NAME_FORMAT = /\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i 
  validates :name, presence: true, length: {maximum: 255}, format: {with: NAME_FORMAT} 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  validates :username, presence: true, length: {maximum: 20, minimum: 3}, uniqueness: true

  PHONE_FORMAT = /\A\d+\Z/ 
  validates :telephone, presence: true, format: {with: PHONE_FORMAT}

  validates :password, presence: true, length: {minimum: 5}
  has_secure_password
end
