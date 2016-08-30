class CreateSensitivities < ActiveRecord::Migration
  def change
    create_table :sensitivities do |t|
      t.string :level

      t.timestamps
    end
  end
end
