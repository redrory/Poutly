class Reminder < ActionMailer::Base
  default from: "notice@poutly.com",
  	:return_path => "reminder@poutly.com"

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

    def new_signup()
      #@name = name
      #@client = Client.find(id)
      mail(:to =>"rwalker@chukkacaribbean.com")
      puts "Inside New User"
      
    end

  	def test_mail()
  		mail(:to =>"rory@rorywalker.com")
      puts "After test_mail"
  		
  	end
end
