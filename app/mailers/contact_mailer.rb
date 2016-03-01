# Contact mailer
class ContactMailer < ApplicationMailer
  default to: 'example@example.com'

  def contact_email(name, message, email)
    @name = name
    @message = message
    @email = email

    mail from: email, subject: "#{@name}'s contacts"
  end
end
