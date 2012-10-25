class GroupMailer < ActionMailer::Base
  default :from => "admin@glocal.com"
  
  #custom email
  def custom_email(email, subject, body)
      @email_body = body
      mail(:to => email, :subject => subject)
  end

end
