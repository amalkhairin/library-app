class User < ApplicationRecord
  NAME_FORMAT = /\A[a-zA-Z]+\z/
  validates :name, presence: true, length: {maximum: 255}, format: {with: NAME_FORMAT} 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
end
