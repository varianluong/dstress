class RemovePhoneFromSchedulers < ActiveRecord::Migration
  def change
    remove_column :schedulers, :phone, :integer
    remove_column :schedulers, :frequency, :string
  end
end
