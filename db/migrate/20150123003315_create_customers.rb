class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :phone
      t.date :date_of_birth
      t.string :email
      t.string :picture
      t.string :deal_id
      t.string :event_id

      t.timestamps null: false
    end
  end
end
