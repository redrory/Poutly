class CreateRems < ActiveRecord::Migration
  def change
    create_table :rems do |t|
      t.string :name

      t.timestamps
    end
  end
end
