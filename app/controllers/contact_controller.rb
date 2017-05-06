class ContactController < ApplicationController
  def mail
    if params[:contact]
      name =  params[:contact][:name]
      email =  params[:contact][:email]
      message = params[:contact][:message]

      if name.present? && email.present? && message.present?
        # Tell the UserMailer to send a welcome email after save
        ContactMailer.send_contact_email(name, email, message).deliver_now
        redirect_to '/#contact-me', notice: 'Thank you for your e-mail! I will get back to you as soon as possible.'
      else
        flash[:warning] = "Please fill out all fields."
        redirect_to '/#contact-me'
      end

    end
  end
end
