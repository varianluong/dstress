class AddSensitivityRefToSolutions < ActiveRecord::Migration
  def change
  	remove_reference :solutions, :trigger, index: true
    add_reference :solutions, :sensitivity, index: true, :after => :response_id
  end
end
