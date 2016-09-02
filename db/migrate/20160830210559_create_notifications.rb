class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :phone_number
      t.time :time

      t.timestamps
    end
  end
end
