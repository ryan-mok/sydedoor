class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates_associated :user
  validates :user_id, presence: true
  validates :company_id, presence: true

  #Only allows rating to be a decimal value between and including 0 and 5
  validates :rating,
            presence: true,
            numericality: {
                less_than_or_equal_to: 5,
                greater_than_or_equal_to: 0
            }

  #Team can discuss whether or not this is a reasonable max length to set
  validates :description,
            presence: true,
            length: {maximum: 2500}

  validates :job_title,
            presence: true

  validates :term,
            presence: true,
            format: {with: /\A[1-4][A-B]\z/, message: 'Not a valid term, must be between 1A and 4B'}

  validates :year,
            presence: true,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 1960
            },
            format: {with: /\A[0-9]{4}\z/, message: 'Not valid year'}

  validates :salary,
            presence: true

  validates :location,
            presence: true
end

