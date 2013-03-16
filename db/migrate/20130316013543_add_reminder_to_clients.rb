class AddReminderToClients < ActiveRecord::Migration
  def change
    add_column :clients, :reminder, :string
  end
end
