class PostsController < ApplicationController
  def new
    logger.info("@@@@@@Post New!")
    logger.info("@@@@@Params, if any: #{params[:project]}")
    logger.info("@@@@@@Params Portfolio Type: #{params[:portfolio_type]}")
    @post = Post.new
    @project_id = params[:project]
    @portfolio_type = params[:portfolio_type]
    @author = current_user.email
    logger.info("@@@@@@@project_id: #{@project_id}")
    logger.info("@@@@@@@project_id: #{@portfolio_type}")
    
  end

  def create
    @project_id = params[:post][:project_id]
    @portfolio_type = params[:post][:portfolio_type]
    @project = Project.where(:id => "#{@project_id}").first 
    @post = Post.new(post_params)
    ##@post = params[:post] 
    @post.username = current_user.email
    @post.title = params[:post][:title]
    
    @post = @project.posts.create(username: @post.username, title: @post.title, content: @post.content )
    
    if @post.save
      flash[:success] = "Post was successfully created."
      redirect_to projects_path(:portfolio_type =>"#{@portfolio_type}")
    end
  end
  def post_params
    params.require(:post).permit(:username,:content,:projects_attributes)
  end
  def project_params
    params.require(:project).permit(:portfolio_type,:name,:timeframe,:location,:project_description,:content,:posts_attributes)
  end
  
  
end
