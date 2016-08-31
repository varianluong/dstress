class AddAttachmentCustomdartboardToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :customdartboard
    end
  end

  def self.down
    remove_attachment :users, :customdartboard
  end
end
