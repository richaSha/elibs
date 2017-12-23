class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :title_id
      t.string :recently_added
      t.string :author
      t.integer :page_count
      t.string :publisher

      t.timestamps
    end
  end
end
