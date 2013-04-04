class Reminder < ActionMailer::Base
  default from: "from@example.com",
  	:return_path => "reminder@paymentreminders.net"

  	def payment_reminder(client,user)
  		@account = client
  		@user = user
  		mail(:to =>@account.email)
  		
  	end
end
