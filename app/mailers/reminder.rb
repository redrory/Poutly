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

     def weekly_email(id,email,project_name,name,amount,due_date)
      @id = id
      @name = name
      @project_name = project_name
      @amount = amount
      @due_date = due_date
      @client = Client.find(id)
      mail(:to =>email)
      puts "right before my method"
      @client.update_attributes(project_name: "EMAIL just sent")
      
    end

  	def test_mail()
  		mail(:to =>"redrory@gmail.com")
  		
  	end
end
