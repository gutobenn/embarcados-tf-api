class AddAttachmentPictureToCompras < ActiveRecord::Migration[5.2]
  def self.up
    change_table :compras do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :compras, :picture
  end
end
