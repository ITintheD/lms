ActionMailer::Base.smtp_settings = {
  :address              => "email-smtp.us-east-1.amazonaws.com",
  :port                 => 587,
  :user_name            => "AKIAJQSDOBW6TQFDRBGQ",
  :password             => "Asot46+dr5LhkJpDnbf6epkO0OQjHSop9kFVKyWO+aww",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
