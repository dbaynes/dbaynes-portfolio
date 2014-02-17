class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    if params[:portfolio_type].nil?
      params[:portfolio_type] = 'professional'
      @projects = Project.all
    else
      @projects = Project.all(:conditions=>"(portfolio_type = '#{params[:portfolio_type]}')")\
    end
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    
    params[:portfolio_type] = @project.portfolio_type
    logger.info("@@@@@Portfolio Type: #{params[:portfolio_type]}")
    if @project.save
      flash[:success] = "#{params[:portfolio_type].capitalize} Project was successfully created."
      redirect_to projects_path(:portfolio_type =>params[:portfolio_type])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:portfolio_type,:name,:timeframe,:location,:project_description)
    end
end
