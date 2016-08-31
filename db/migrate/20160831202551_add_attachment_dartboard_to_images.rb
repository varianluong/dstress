class AddAttachmentDartboardToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :dartboard
    end
  end

  def self.down
    remove_attachment :images, :dartboard
  end
end
