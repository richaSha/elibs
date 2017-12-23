class ChangeTitleIdFromReview < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :title_id
  end
end
