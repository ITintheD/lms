class Agenda < ActiveRecord::Base
  attr_accessible :body, :featured, :instructor_id, :status, :title, :week_id
  belongs_to :instructor
  belongs_to :week
  
  def self.current_featured
    Agenda.where(:featured => true).order('created_at').first
  end
end
