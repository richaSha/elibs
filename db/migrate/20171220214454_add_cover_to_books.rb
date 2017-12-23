class AddCoverToBooks < ActiveRecord::Migration[5.0]
  def self.up
    change_table :books do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :books, :cover
  end
end
