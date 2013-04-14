class Client < ActiveRecord::Base
  attr_accessible :project_name, :name, :due_date, :amount, :email, :reminder
	belongs_to :user

  validates :project_name, presence: true, length: { maximum: 140}
  validates :user_id, presence: true
  validates :due_date, presence: true
  validates :amount, presence: true, :on =>:create
  validates :name, presence: true

  validate :presence_of_email, :on => :client_reminder

  default_scope order: 'clients.created_at DESC'

  def presence_of_email
  	unless new_record?
  	  errors.add :email, "can't be blank." if email.blank?
  	end
  end

  def self.cron_test
    Reminder.test_mail.deliver
  end

  def self.email_update
    @user = User.all
    @client = Client.all
    @client.each do |c|
      unless c.email.nil? || if c.reminder == "--- \n- Daily\n" || c.reminder == "--- \n- Daily\n- Weekly\n" && c.paid == false 
        puts "Daily fixed" + c.email
        #Reminder.payment_test(c.email,c.project_name,c.name,c.amount,c.due_date).deliver
      end
    end
    end
  end

  def self.weekly_email
    @user = User.all
    @client = Client.all
    @client.each do |c|
      unless c.email.nil? || if c.reminder == "--- \n- Weekly\n" || c.reminder == "--- \n- Daily\n- Weekly\n" && c.paid == false 
        puts "Weekly fixed" + c.email
        Reminder.weekly_email(c.email,c.project_name,c.name,c.amount,c.due_date).deliver
      end
    end
    end
  end

end
