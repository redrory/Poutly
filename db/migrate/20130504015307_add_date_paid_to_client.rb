class AddDatePaidToClient < ActiveRecord::Migration
  def change
    add_column :clients, :date_paid, :date
  end
end
