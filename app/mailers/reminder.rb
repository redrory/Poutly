class Reminder < ActionMailer::Base
  default from: "from@example.com",
  	:return_path => "reminder@paymentreminders.net"

  	def payment_reminder(client,user)
  		@account = client
  		@user = user
  		mail(:to =>@account.email)
  		
  	end

    def payment_test(email,project_name,name,amount,due_date)
      #@account = client
      @name = name
      @project_name = project_name
      @amount = amount
      @due_date = due_date
      mail(:to =>email)
      
    end

  	def test_mail()
  		mail(:to =>"redrory@gmail.com")
  		
  	end
end
