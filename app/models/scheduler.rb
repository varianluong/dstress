class Scheduler < ActiveRecord::Base
  belongs_to :reminder
  belongs_to :user
end
