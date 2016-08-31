class NotificationsController < ApplicationController
  def index
  end



  private

  @@REMINDER_TIME = 30.minutes

  def reminder
    @twilio_number = ENV['+17206051054']
    @client = Twilio::REST::Client.new ENV['AC4ed220db9c13d448b3091b1be70e89ab'], ENV['e36ea068697b061fa1a200134ac3d936']
    time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => reminder,
    )
    puts message.to
  end

  def when_to_run
    time - @@REMINDER_TIME
  end

  def appointment_params
      params.require(:notifications).permit(:name, :phone_number, :time, :time_zone)
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }

end

