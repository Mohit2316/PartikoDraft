class CreateEvents < ActiveRecord::Migration
  drop_table :events
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :picture
      t.string :description
      t.string :timings
      t.string :club_id

      t.timestamps null: false
    end
  end
end
