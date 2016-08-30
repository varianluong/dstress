class Solution < ActiveRecord::Base
  # relationships
  belongs_to :reason
  belongs_to :response

  # validations
end
