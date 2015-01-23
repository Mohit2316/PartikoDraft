class CreateClubs < ActiveRecord::Migration
  drop_table :clubs
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :location
      t.string :picture
      t.string :description
      t.string :provider
      t.datetime :expires_on

      t.timestamps null: false
    end
  end
end
