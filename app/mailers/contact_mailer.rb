class ContactMailer < ActionMailer::Base
  default from: ENV['SENDER_EMAIL']

  def contact_message(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: 'andrew.glover993@gmail.com', from: @email, subject: "New message from contact form on Atlas Does"
  end
end
