class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable   #needs to be added to other models that have this association
  
  #belongs_to :username, class_name: "User"
  
  attr_accessor :portfolio_type
 
  def status_published?
 	  status == 'Published'
  end  
  def published?
 	  published == true
  end  
  def unpublished?
  	  published == false
   end  
	
  
end
