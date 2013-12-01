class Entry < ActiveRecord::Base
  attr_accessible :customer_number, :end_time, :start_time
  has_many :addons
  has_many :items, through: :addons

  def elapsed_time
    if end_time
      diff = self.end_time - self.start_time
    else
        nil
    end
  end

  def formatted_time
    if end_time
      diff = self.end_time - self.start_time
      seconds = diff % 60.to_i
      minutes = (diff / 60) % 60.to_i
      hours = (diff / 60) / 60.to_i
      "%02d:%02d" % [hours, minutes]      
    else
      nil
    end
  end

  def addon_total
    total = 0
    self.addons.each do |addon|
      total += addon.amount
    end
    total
  end
end
