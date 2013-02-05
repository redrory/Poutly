class Client < ActiveRecord::Base
  attr_accessible :project_name
	belongs_to :user

	validates :project_name, presence: true, length: { maximum: 140}
  validates :user_id, presence: true

  default_scope order: 'clients.created_at DESC'
end
