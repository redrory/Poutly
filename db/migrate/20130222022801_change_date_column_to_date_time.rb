class ChangeDateColumnToDateTime < ActiveRecord::Migration
  def up
  	remove_column :clients, :due_date, :string
  	add_column :clients, :due_date, :date
  end

  def down
  	remove_column :clients, :due_date, :string
  	add_column :clients, :due_date, :date
  end
end
