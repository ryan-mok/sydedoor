class Review < ApplicationRecord
  validates :user_id, presence: true
  validates :company_id, presence: true
  validates :rating, presence: true
end
