class Session < ActiveRecord::Base
  attr_accessible :location, :meal
  
  has_many :weighings
  
  has_one :graph
  
end
