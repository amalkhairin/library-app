class User < ApplicationRecord
  NAME_FORMAT = /\A[a-zA-Z]+\z/
  validates :name, presence: true, length: {maximum: 255}, format: {with: NAME_FORMAT} 
  validates :email, presence: true 
end
