class Agenda < ActiveRecord::Base
  attr_accessible :body, :featured, :instructor_id, :status, :title, :week_id, :doc
  
  mount_uploader :doc, DocUploader
  
  acts_as_readable 
  
  belongs_to :instructor
  belongs_to :week
  
  validates_presence_of :week_id, :title, :body
  
  def self.current_featured
    Agenda.where(:featured => true).order('created_at DESC').first
  end
end
