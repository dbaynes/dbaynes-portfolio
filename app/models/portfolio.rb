class Portfolio < ActiveRecord::Base
  has_many :projects
  
  mount_uploader :image, ImageUploader
    
end
