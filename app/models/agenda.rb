class Agenda < ActiveRecord::Base
  attr_accessible :body, :featured, :instructor_id, :status, :title, :week_id
  
  acts_as_readable 
  
  belongs_to :instructor
  belongs_to :week
  
  validates_presence_of :week_id
  
  def self.current_featured
    Agenda.where(:featured => true).order('created_at').first
  end
end
