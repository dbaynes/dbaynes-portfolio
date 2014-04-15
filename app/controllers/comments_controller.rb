class CommentsController < ApplicationController
  before_filter :load_commentable
  def index
    #@commentable = Post.find(params[:post_id])  see before_filter
    @comments = @commentable.comments
  end
  def new
    @comment = @commentable.comments.new
  end
  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      #redirect_to [@commentable, :comments], notice: "Comment created"
      redirect_to @commentable, notice: "Comment created"
    else
      render :new
    end
  end
  
  
  def comment_params
    params.require(:comment).permit(:content, :posts_attributes)
  end
  private
  def load_commentable
    resource, id = request.path.split('/')[1,2] # /posts/33 = resource = posts, id = 33
    @commentable = resource.singularize.classify.constantize.find(id) #  = Post.find(33)
  end
  #alternative:
  #def load_commentable
  #  klass= [Post, Project].detect {|c| params["#{c.name.underscore}_id"]}
  #  @commentable = klass.find(params["#{klass.name.underscore}_id"])
  #end
end
