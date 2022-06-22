# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users
  validates :role, presence: true
end
