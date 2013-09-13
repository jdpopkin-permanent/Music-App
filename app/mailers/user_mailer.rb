class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def welcome_email(user, url)
    @user = user
    @url = url
    mail(to: user.email, subject: "S|_________|P")
  end
end
