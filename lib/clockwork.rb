require 'rubygems'
require 'clockwork'
include Clockwork

require 'config/boot'
require 'config/environment'

every(1.day, 'newsletter.deliver') { 
mailers = New_timer.find(:all, :conditions => ["mailer_at <= ? and mailer_at > ?", Time.now.advance(:days => 1), Time.now])

unless mailers.nil?
  mailers.each do |send_mail|
    next if send_mail.user.email == ""
    UserMailer.newsletter(send_mail.user_id)
    send_mail.mailed_at = Time.now + (send_mail.user.profiles.frequency).days
  end
end
}  


# Now using command prompt go to the root directory of the application and run the command
# clockwork lib/clock.rb
# If you are using delayed_job then you will have to  rake jobs:work in another command 
# prompt This will trigger an event every 1 day which will get all 
# the reminders that needs to be send in the next two minutes and delivers it.