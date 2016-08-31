class Reminder < ActiveRecord::Base
  #has_one :scheduler, dependent: :destroy
  has_many :tips, dependent: :destroy
end
