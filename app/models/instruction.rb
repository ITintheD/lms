class Instruction < ActiveRecord::Base
  attr_accessible :body, :featured, :instructor_id, :status, :title
end
