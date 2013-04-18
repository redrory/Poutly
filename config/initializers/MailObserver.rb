class MailObserver
	def self.delivered_email(message)

		puts "Observerd!!"
		##Client.update_email
	end
end

 ActionMailer::Base.register_observer(MailObserver)