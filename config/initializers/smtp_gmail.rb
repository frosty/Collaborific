ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
  :domain => "collaborific.com",
  :user_name => "librarian@collaborific.com",
  :password => "Han98}Calvin"
}