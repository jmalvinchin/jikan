class Addon < ActiveRecord::Base
  attr_accessible :quantity, :item_id
  belongs_to :entry
  belongs_to :item
end
