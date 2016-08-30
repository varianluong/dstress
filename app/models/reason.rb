class Reason < ActiveRecord::Base
  # relationships
  has_many :solutions, dependent: :destroy
  has_many :responses_given, through: :solutions, source: :response

  # validations
end
