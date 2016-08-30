class CreateSchedulers < ActiveRecord::Migration
  def change
    create_table :schedulers do |t|
      t.integer :phone
      t.string :frequency
      t.references :reminder, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
