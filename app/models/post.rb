class Post < ActiveRecord::Base
  belongs_to :project
  
  #belongs_to :username, class_name: "User"
 
  def status_published?
 	  status == 'Published'
  end  
	
  
end
