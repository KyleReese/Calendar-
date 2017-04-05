require 'digest/sha2'
class NotificationMailer < ApplicationMailer
	  default from: ENV['GMAIL_USERNAME']
	  domain = 'calendar.plus.plus.team.mail'
	  #default "Message-ID" => lambda {"<#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@#{domain}>"}

	# Call these methods like:
	# NotificationMailer.sample_email(@user).deliver_now or .deliver_later
  	# NotificationMailer.test_email(@user, "This is an email.").deliver_now or .deliver_later
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Email')
  end
  def test_email(user, email_body)
    mail(to: ENV['GMAIL_USERNAME'],
         body: email_body,
         content_type: "text/html",
         subject: "Already rendered!")
  end
end
