class Response < ActiveRecord::Base
  # relationships
  has_many :solutions
  has_many :reasons_solved, through: :solutions, source: :reason

  # validations
end
