class Reminder < ActionMailer::Base
  default from: "from@example.com",
  	:return_path => "reminder@paymentreminders.net"

  	def payment_reminder(client)
  		@account = client
  		mail(:to =>"redrory@gmail.com")
  		
  	end
end
