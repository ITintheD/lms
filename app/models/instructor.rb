class Instructor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :photo, :firstname, :lastname, :description
  # attr_accessible :title, :body
  mount_uploader :photo, PhotoUploader
  
  has_many :agendas
  has_many :announcements
  has_many :instructions
  has_many :resources
end
