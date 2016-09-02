class Sensitivity < ActiveRecord::Base
  has_many :triggers, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_many :responses_given, through: :solutions, source: :response

  # validations
end
