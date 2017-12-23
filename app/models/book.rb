class Book < ApplicationRecord
  has_many :reviews
  has_many :order_items
  belongs_to :title
  validates :name, :title_id ,:author, presence: true
  before_destroy :remove_linked_items

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  def remove_linked_items
    self.order_items.destroy_all
  end
end
