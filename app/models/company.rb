class Company < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true
  validates :website, presence: true
end
