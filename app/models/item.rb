class Item < ActiveRecord::Base
  attr_accessible :name, :price
  has_many :addons
  has_many :entries, through: :addons
  validates :name, presence: true
  validates :price, presence: true
end
