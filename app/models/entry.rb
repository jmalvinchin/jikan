class Entry < ActiveRecord::Base
  attr_accessible :customer_number, :end_time, :start_time
  has_many :addons
  has_many :items, through: :addons

  def elapsed_time
    if end_time
        self.end_time - self.start_time
    else
        nil
    end
  end
end
