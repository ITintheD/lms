class Agenda < ActiveRecord::Base
  attr_accessible :body, :featured, :instructor_id, :status, :title, :week
  belongs_to :instructor
  
  def self.current_featured
    Agenda.where(:featured => true).order('created_at').first
  end
end
