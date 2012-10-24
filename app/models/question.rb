class Question < ActiveRecord::Base
  attr_accessible :body, :featured, :questionable_id, :questionable_type, :status, :title
  belongs_to :questionable, :polymorphic => true

end
