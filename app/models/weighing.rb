class Weighing < ActiveRecord::Base
  attr_accessible :duration, :weight, :t_weight
  
  belongs_to :session
end
