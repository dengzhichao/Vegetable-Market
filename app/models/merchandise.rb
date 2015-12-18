class Merchandise < ActiveRecord::Base
  validates_presence_of :category, :name,
  :price, :max_order
  
  has_many :attachments
  has_many :carts
  
  has_many :order_items
end

