class Week < ActiveRecord::Base
  attr_accessible :title, :start_time, :end_time
  has_many :resources
  has_many :announcements
  has_many :agendas
end
