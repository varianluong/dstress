class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :reason, index: true
      t.references :response, index: true

      t.timestamps
    end
  end
end
