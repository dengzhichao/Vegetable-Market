class Cart < ActiveRecord::Base
  validates_presence_of :number_of_items
  
  belongs_to :user
  belongs_to :merchandise
end
