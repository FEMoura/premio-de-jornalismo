class AddAttachmentArchiveToProposals < ActiveRecord::Migration
  def self.up
    change_table :proposals do |t|
      t.attachment :archive
    end
  end

  def self.down
    remove_attachment :proposals, :archive
  end
end
