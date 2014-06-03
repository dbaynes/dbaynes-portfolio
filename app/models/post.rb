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
	 def self.create_from_postmark(mitt)
     api_token = mitt.to.split("@").first.split("+").last
     user = User.find_by_api_token(api_token)
     if user
       post = user.posts.new
       post.message_id = mitt.message_id
       post.title      = mitt.subject
       post.body = if mitt.text_body.blank?
         mitt.html_body
       else
         mitt.text_body
       end
       # post.photo = mitt.attachments.first.read unless mitt.attachments.empty?
       post.save
     else
       return false
     end
   end
  
  
end
