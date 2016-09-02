class Solution < ActiveRecord::Base
  # relationships
  belongs_to :reason
  belongs_to :response
  belongs_to :sensitivity

  # validations
end
