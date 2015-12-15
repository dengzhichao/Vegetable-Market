class Merchandise < ActiveRecord::Base
  validates_presence_of :category, :name,
  :price, :max_order
end

