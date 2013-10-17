class Weighing < ActiveRecord::Base
  attr_accessible :duration, :weight, :t_weight, :count, :session_average, :average, :session_duration_average, :duration_average
  
  belongs_to :session
  
end
