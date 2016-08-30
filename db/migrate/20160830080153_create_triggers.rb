class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.string :content
      t.references :sensitivity, index: true

      t.timestamps
    end
  end
end
