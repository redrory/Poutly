class AddEmailSentToClients < ActiveRecord::Migration
  def change
    add_column :clients, :email_sent, :boolean, :default => false
  end
end
