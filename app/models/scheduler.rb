class Scheduler < ActiveRecord::Base
  belongs_to :reminder
  belongs_to :user
  validates :phone, presence: true
  validates :frequency, presence: true


  after_create :reminder

  # @@REMINDER_TIME = 1.minutes # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
  def reminder
    # job_id = SCHEDULER.every '24h' do
    SCHEDULER.every '5s', :times => 2 do
    @twilio_number = '+17206051054'
    time_str = ((self.frequency).utc)
    reminder = "You only fail when you stop trying"
    message = TWILIOCLIENT.account.messages.create({
      :from => @twilio_number,
      :to => self.phone,
      :body => reminder,
    })
    puts message.to
    end
  end


  # def self.destroy_job job_id
  #   job = scheduler.job(job_id)
  #   job.kill if job.running?
  # end

end


