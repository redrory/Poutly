# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Poutly::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app15504772@heroku.com'],
  :password       => ENV['ke6c2c8d'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}