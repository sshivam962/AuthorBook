class Author < ApplicationRecord
  has_and_belongs_to_many :books
  validates :first_name,:last_name, :dob, presence: true
end
