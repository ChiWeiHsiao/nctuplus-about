class AddAttachmentMemberImageToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.attachment :member_image
    end
  end

  def self.down
    drop_attached_file :members, :member_image
  end
end
