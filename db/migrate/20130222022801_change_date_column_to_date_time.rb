class ChangeDateColumnToDateTime < ActiveRecord::Migration
  def up
  	change_column :clients, :due_date, :date
  end

  def down
  	change_column :clients, :due_date, :string
  end
end
