class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :reviews

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :name, :email, uniqueness: true

  def previous_orders
    self.orders.where(status: 1).includes(order_items: :book)
  end
end
