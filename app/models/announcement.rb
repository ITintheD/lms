class Announcement < ActiveRecord::Base
  attr_accessible :body, :featured, :instructor_id, :status, :title, :doc, :week_id
  mount_uploader :doc, DocUploader
  belongs_to :instructor
  belongs_to :week
  
  def self.current_featured
    Announcement.where(:featured => true).order('created_at').first
  end
  
end
