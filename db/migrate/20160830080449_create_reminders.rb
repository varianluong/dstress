class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :reminder_type

      t.timestamps
    end
  end
end
