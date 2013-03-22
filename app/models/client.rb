class Client < ActiveRecord::Base
  attr_accessible :project_name, :name, :due_date, :amount, :email
	belongs_to :user

  validates :project_name, presence: true, length: { maximum: 140}
  validates :user_id, presence: true
  validates :due_date, presence: true
  validates :amount, presence: true, :on =>:create
  validates :name, presence: true

  default_scope order: 'clients.created_at DESC'
end
