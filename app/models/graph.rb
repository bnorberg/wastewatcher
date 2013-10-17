class Graph < ActiveRecord::Base
  attr_accessible :session_id
  
  belongs_to :session
end
