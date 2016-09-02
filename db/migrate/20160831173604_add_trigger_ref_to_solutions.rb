class AddTriggerRefToSolutions < ActiveRecord::Migration
  def change
    add_reference :solutions, :trigger, index: true
  end
end
