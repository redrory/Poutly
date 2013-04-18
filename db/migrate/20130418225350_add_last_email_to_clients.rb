class AddLastEmailToClients < ActiveRecord::Migration
  def change
    add_column :clients, :last_email, :date
  end
end
