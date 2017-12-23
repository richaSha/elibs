class Title < ApplicationRecord
  has_many :books
  validates :title, presence: true
  before_destroy :remove_linked_items


  def remove_linked_items
    self.books.destroy_all
  end
end
