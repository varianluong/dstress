class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :tip
      t.references :reminder, index: true

      t.timestamps
    end
  end
end
