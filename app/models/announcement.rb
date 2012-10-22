class Announcement < ActiveRecord::Base
  attr_accessible :body, :featured, :instructor_id, :status, :title, :doc
  mount_uploader :doc, DocUploader
  belongs_to :instructor
  
end
