class AddAttachmentArchiveToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :archive
    end
  end

  def self.down
    remove_attachment :users, :archive
  end
end
