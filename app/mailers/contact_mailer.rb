class ContactMailer < ApplicationMailer
  default from: 'contact@sy-portfolio.herokuapp.com'

  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: 'shouhei.yamauchi@live.com', subject: 'Email from Portfolio Website') do |format|
      format.html { render 'contact_mailer' }
      format.text { render 'contact_mailer' }
    end
  end
end
