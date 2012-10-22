class Resource < ActiveRecord::Base
  attr_accessible :description, :featured, :link, :resourceable_id, :resourceable_type, :status, :title, :doc
  belongs_to :resourceable, :polymorphic => true
  mount_uploader :doc, DocUploader

end
