class Project < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  accepts_nested_attributes_for :posts, :allow_destroy => true
  validates :name,                :presence => true,
                                  :length => { :minimum => 5 }
  validates :timeframe,           :presence=> true
  validates :location,            :presence => true
  validates :project_description, :presence => true,
                                  :length => {:maximum => 500}       
 end
