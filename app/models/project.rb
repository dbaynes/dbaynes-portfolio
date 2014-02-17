class Project < ActiveRecord::Base
  validates :name,                :presence => true,
                                  :length => { :minimum => 5 }
  validates :timeframe,           :presence=> true
  validates :location,            :presence => true
  validates :project_description, :presence => true,
                                  :length => {:maximum => 500}       
 end
