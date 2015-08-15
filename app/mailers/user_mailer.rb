class UserMailer < ApplicationMailer
  default from: "mailer@team3app.com"

  def newsletter(user)
  @user = user
  mail to: @user.email, subject: "Success! You did it."
  end
end
