class AddPhoneFromSchedulers < ActiveRecord::Migration
  def change
    add_column :schedulers, :phone, :string
    add_column :schedulers, :frequency, :datetime
  end
end
