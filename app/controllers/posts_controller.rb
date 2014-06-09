class PostsController < ApplicationController
  load_and_authorize_resource
  def new
    logger.info("@@@@@@Post New!")
    logger.info("@@@@@Params, if any: #{params[:project]}")
    logger.info("@@@@@@Params Portfolio Type: #{params[:portfolio_type]}")
    @post = Post.new
    @project_id = params[:project]
    @portfolio_type =  "professional"  #params[:portfolio_type]
    if user_signed_in?
      @author = current_user.email
    else
      @author = "Default Guest"
    end
    
    logger.info("@@@@@@@project_id: #{@project_id}")
    logger.info("@@@@@@@project_id: #{@portfolio_type}")
    
  end
  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  
  end

  def create
    @project_id = params[:post][:project_id]
    @portfolio_type = params[:post][:portfolio_type]
    
    @post = Post.new(post_params)
    #@project = @post.project 
    #@project = Project.where(:id => "#{@project_id}").first 
    @project = @post.project #@project = Project.where(:id => "#{@project_id}").first 
    logger.info("@@@@@@post.Title: #{@post.title}")
    logger.info("@@@@@@post.status: #{@post.status}")
    #logger.info("@@@@@portfolio_type: #{@project.portfolio_type}")
    ##@post = params[:post] 
    if user_signed_in?
      @post.username = current_user.email
    else
      @post.username = 'Guest'
    end
    @post.title = params[:post][:title]
    @post.status = "Unpublished"
    logger.info("@@@@@Post Status: #{@post.status}")
    @post.author_id = current_user.id 
    @post = @project.posts.create(username: @post.username, title: @post.title, content: @post.content, author_id: @post.author_id, status: @post.status )
    
    if @post.save
      flash[:success] = "Post was successfully created."
      logger.info("Email Delay setup")
      #WORKS:PostMailer.post_approval_request(@post).deliver
      PostMailer.delay_for(5.minutes).post_approval_request(@post)

      #WORKS FOR LETTEROPENER ONLY: PostMailer.delay_for(5.seconds).post_approval_request(@post)
      #PostMailer.delay.welcome_email
      #PostMailer.post_approval_request(@post).delay_for(5.seconds)
      redirect_to projects_path(:portfolio_type =>"#{@project.portfolio_type}")
    end
  end
  def edit
  end
  def update
    logger.info("@@@@@@params[:post]: #{params[:post]}") #published
    logger.info("@@@@@@params[:id]: #{params[:id]}") #post id
    
    #@project_id = params[:post][:project_id]
    #@portfolio_type = params[:post][:portfolio_type]
    
    @post = Post.find(params[:id])
    #@post
    #@project_id = Project.@post(:project_id)
    @project = @post.project
    logger.info("@@@@@@test: #{@project.portfolio_type}")
    logger.info("@@@@@post: #{@post.project_id}")
    logger.info("@@@@@@post.title: #{@post.title}")
    logger.info("@@@@@@post.status: #{@post.status}")
    logger.info("@@@@@@post.username: #{@post.username}")
    logger.info("@@@@@@post.project_id: #{@post.project_id}")
    #@project = Project.where(:id => "#{@post.project_id}").first 
    logger.info("@@@@@@portfolio_type:  = #{@project.portfolio_type}")
    
    if current_user.role != 'editor'
      @post.username = current_user.email
    end
    #@post.title = params[:post][:title]
    if @post.status == "Unpublished"
      @post.status = "Published"
      @post.published = true
    elsif @post.status == "Published"
      @post.status = "Unpublished"
      @post.published = false
    else
      @post.status = "Unpublished"
      @post.published = false
    end
      
    logger.info("@@@@@Post Status: #{@post.status} for #{@post.title}")
     
    ##@post = @project.posts.create(username: @post.username, title: @post.title, content: @post.content, status: @post.status )
    
    if @post.save
      flash[:success] = "Post was successfully updated."
      redirect_to projects_path(:portfolio_type =>"#{@project.portfolio_type}")
    end
  end
  # DELETE /posts/1
  def destroy
    @portfolio_type = params[:portfolio_type]
    logger.info("@@@@@@POSTS DESTROY - Portfolio: #{params[:portfolio_type]}")
    @post.destroy
    redirect_to projects_path(:portfolio_type =>@portfolio_type), notice: 'Post was successfully destroyed.'
  end
  
  def post_params
    params.require(:post).permit(:email, :username,:content, :title, :project_id, :status,:published, :projects_attributes)
  end
  def comment_params
    params.require(:comment).permit(:content,:commentable, :posts_attributes)
  end
  
  def project_params
    params.require(:project).permit(:email, :project_id, :portfolio_type,:title,:timeframe,:location,:project_description,:content,:posts_attributes)
  #Unpermitted parameters: project_id, portfolio_type, title
  end
  
  
end
