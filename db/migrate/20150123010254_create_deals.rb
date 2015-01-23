class CreateDeals < ActiveRecord::Migration
  drop_table :deals
  def change
    create_table :deals do |t|
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
