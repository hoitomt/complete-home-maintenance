ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "complete-home-maintenance.com",
  :user_name            => "admin@complete-home-maintenance.com",
  :password             => "my 3 kids",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
