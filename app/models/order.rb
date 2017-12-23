class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user, optional: true

  def item_total
    order_items.collect { |item| item.quantity }.sum
  end



  def finalize(user)
    self.user_id = user.id
    self.status = 1
    self.save
  end

  def finalized?
    return self.status == 1
  end
end
