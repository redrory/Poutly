class ChangeDateColumnToDateTime < ActiveRecord::Migration
  def up
  	remove_column :clients, :due_date
  	add_column :clients, :due_date, :date
  end

  def down
  	add_column :clients, :due_date, :date
  	remove_column :clients, :due_date
  end
end
