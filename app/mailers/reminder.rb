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

    def daily_email(id,email,project_name,name,amount,due_date)
      @id = id
      @name = name
      @project_name = project_name
      @amount = amount
      @due_date = due_date
      @client = Client.find(id)
      mail(:to =>email)
      puts "Inside Daily email sent method"
      @client.update_attributes(last_email: Time.now, email_sent: true)
      
    end

     def weekly_email(id,email,project_name,name,amount,due_date)
      @id = id
      @name = name
      @project_name = project_name
      @amount = amount
      @due_date = due_date
      @client = Client.find(id)
      mail(:to =>email)
      puts "Inside weekly email sent method"
      @client.update_attributes(last_email: Time.now, email_sent: true)
      
    end

  	def test_mail()
  		mail(:to =>"redrory@gmail.com")
  		
  	end
end
