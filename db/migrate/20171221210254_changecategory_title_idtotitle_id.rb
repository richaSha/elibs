class ChangecategoryTitleIdtotitleId < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :category_title_id
    add_column :reviews, :title_id, :integer
  end
end
