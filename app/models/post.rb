class Post < ActiveRecord::Base
  belongs_to :project
  has_many :comments, as: :commentable   #needs to be added to other models that have this association
  
  #belongs_to :username, class_name: "User"
 
  def status_published?
 	  status == 'Published'
  end  
	
  
end
