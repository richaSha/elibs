class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :book_id
      t.integer :category_title_id
      t.integer :user_id
      t.string :review

      t.timestamps
    end
  end
end
