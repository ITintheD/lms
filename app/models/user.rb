class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :photo, :firstname, :lastname, :description
  # attr_accessible :title, :body
  mount_uploader :photo, PhotoUploader
  
  acts_as_reader

  has_many :resources, :as => :resourceable
  has_many :questions, :as => :questionable
end
