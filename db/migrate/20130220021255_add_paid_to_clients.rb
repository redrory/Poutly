class AddPaidToClients < ActiveRecord::Migration
  def change
    add_column :clients, :paid, :boolean, default: false
  end
end
