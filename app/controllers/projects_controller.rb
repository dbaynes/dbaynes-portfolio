class ProjectsController < ApplicationController
  #before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:start, :index]
  load_and_authorize_resource :except => [:start, :index]#, :through => :current_user
  def start
    if user_signed_in?
    else
      current_user = User.new
      current_user.role = 'guest'
    end
    render 'start'
  end
  # GET /projects
  def index
    if params[:portfolio_type].blank? 
      redirect_to root_url #  params[:portfolio_type] ='all'
    else
      @prof = params[:portfolio_type]
      @projects = Project.where(portfolio_type: @prof)
       respond_to do |format|
         format.html do
          end
         format.js do
           #binding.pry
           render 'index'
         end
       end
    end
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @post = Post.new
   end

  # GET /projects/1/edit
  def edit
   end

  # POST /projects
  def create
    logger.info("@@@@@Project Create!")
    if !@post.nil?
       logger.info("@@@@@Post Stuff: #{@post.content}")
    end
    @project = Project.new(project_params)
    params[:portfolio_type] = @project.portfolio_type
    logger.info("@@@@@Project Create- params: #{params[:portfolio_type]} field-type: #{@project.portfolio_type}")
    respond_to do |format|
      format.html do
        if @project.save
          flash[:success] = "#{params[:portfolio_type].capitalize} Project was successfully created."
          redirect_to projects_path(:portfolio_type =>params[:portfolio_type])
        else
          render action: 'new'
        end
      end
      format.js do
        #binding.pry
        unless @project.save
          render text: @project.errors.full_messages.join,
          status: :unprocessable_entity
        end
          @result = 'Project was successfully created!'
          #flash[:success] = "#{params[:portfolio_type].capitalize} Project was successfully created."
      end
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      @result = 'Project was successfully updated!'
      redirect_to @project, notice: 'Project was successfully updated.'
      #flash[:success] = "#{params[:portfolio_type].capitalize} Project was successfully updated."
    else
      render :update
    end
  end

  # DELETE /projects/1
  def destroy
    @portfolio_type = @project.portfolio_type
    @project.destroy
    redirect_to projects_path(:portfolio_type =>@portfolio_type), notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      logger.info("@@@@@@project-params")
      params.require(:project).permit(:portfolio_type,:name,:timeframe,:location,:project_description,:content,:status,:post_attributes,:users_attributes)
    end
    def post_params
      logger.info("@@@@@@post-params")
      params.require(:post).permit(:status,:published,:content)
    end
    def user_params
      logger.info("@@@@@@user-params")
      params.require(:user).permit(:role,:users_attributes)
    end
    def role_params
      logger.info("@@@@@@role-params")
      params.require(:role).permit!
    end

end
