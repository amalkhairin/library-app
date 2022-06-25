# frozen_string_literal: true

class BookCategory < ApplicationRecord
  belongs_to :buku
  belongs_to :category
end
