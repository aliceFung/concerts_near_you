class NewsletterMailerJob < ActiveJob::Base
  queue_as :default


  def perform(user)
    @user = user
    UserMailer.newsletter(@user).deliver_later
  end
end
