class Addon < ActiveRecord::Base
  attr_accessible :quantity, :item_id, :amount
  belongs_to :entry
  belongs_to :item
  validates :quantity, presence: true
  validates :item_id, presence:

  def compute_amount
    if self.item
        self.amount = self.item.price * self.quantity
    else
        nil
    end
  end

end
