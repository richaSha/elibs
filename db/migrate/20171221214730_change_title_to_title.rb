class ChangeTitleToTitle < ActiveRecord::Migration[5.0]
  def change
    remove_column :titles, :title
    add_column :titles, :title, :string
  end
end
