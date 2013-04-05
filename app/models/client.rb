class Client < ActiveRecord::Base
  attr_accessible :project_name, :name, :due_date, :amount, :email, :reminder
	belongs_to :user

  validates :project_name, presence: true, length: { maximum: 140}
  validates :user_id, presence: true
  validates :due_date, presence: true
  validates :amount, presence: true, :on =>:create
  validates :name, presence: true

  validate :presence_of_email

  default_scope order: 'clients.created_at DESC'

  def presence_of_email
  	unless new_record?
  	  errors.add :email, "can't be blank." if email.blank?
  	end
  end
end
