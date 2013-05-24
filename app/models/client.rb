class Client < ActiveRecord::Base
  attr_accessible :project_name, :name, :due_date, :amount, :email, :reminder, :last_email, :email_sent, :paid, :date_paid
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

  def self.daily_email
    # Retrieve all users
    @users = User.all

    # Loop through users and get their clients
    @users.each do |user|
      clients = user.clients
      # loop through client and sent params to email
      clients.each do |client|
        if client.email? && client.reminder == "Daily" && !client.paid?
          # Visual queue to browser
          puts "Daily |User's name = #{user.name}, Client's name #{client.name}"
          # Send info to action mailer
          Reminder.daily_email(client).deliver
        end
      end
    end
  end

  def self.weekly_email
    @user = User.all

    @user.each do |u|
      @user_name = u.name
    end

    @client = Client.all
    @client.each do |c|
      unless c.email.nil? || if c.reminder == "Weekly" && c.paid == false 
        puts "Weekly fixed | User Name_" + @user_name + "|  Client Name_" + c.name
        Reminder.weekly_email(@user_name,c.id,c.email,c.project_name,c.name,c.amount,c.due_date).deliver
      end
    end
    end
  end

end
