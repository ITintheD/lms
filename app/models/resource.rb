class Resource < ActiveRecord::Base
  attr_accessible :description, :featured, :link, :resourceable_id, :resourceable_type, :status, :title, :doc, :week_id
  mount_uploader :doc, DocUploader
  belongs_to :resourceable, :polymorphic => true
  belongs_to :week

end
