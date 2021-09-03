class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  validates :book_title, presence: true
end
