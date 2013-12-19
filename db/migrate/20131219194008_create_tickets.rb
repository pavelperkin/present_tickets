class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.string :header
      t.text :description

      t.timestamps
    end
  end
end
