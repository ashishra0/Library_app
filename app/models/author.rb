class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates_uniqueness_of :name
end
