class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if
      @projects = policy_scope(Project)
    end
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    debugger
    @project = Project.new(project_params)
    @project.creator_id = current_user.creator_id
    if @project.save
      redirect_to projects_path, notice: "Project created successfully."
    else
      render 'new'
    end
  end

  def show

  end


  def edit
    authorize @project
  end

  def update
    debugger
    #@project = Project.update(project_params)
    #@project.creator_id = current_user.id
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    #debugger
    authorize @project
    if @project.destroy
      redirect_to root_path, notice: "Project deleted successfully"
    else
      redirect_to @project, notice: "Deletion Failed"
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, user_ids: [])
  end
end
