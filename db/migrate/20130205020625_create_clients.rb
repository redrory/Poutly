class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :project_name
      t.string :name
      t.string :email
      t.string :due_date
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
    add_index :clients, [:user_id, :created_at]
  end
end
