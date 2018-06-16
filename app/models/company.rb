class Company < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
end
