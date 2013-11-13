class Entry < ActiveRecord::Base
  attr_accessible :customer_number, :end_time, :start_time
  has_many :items
end
