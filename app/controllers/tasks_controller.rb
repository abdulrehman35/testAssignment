class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy, :change_status]
  before_action :authenticate_user!
  def new
    #debugger
    @project = Project.find(params[:project_id])
  end

  def create
    # @project = Project.find(params[:project_id])
    #  @task = @project.tasks.create(task_params)
    #  redirect_to project_path(@project)
    #debugger
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    @task.creator_id = current_user.id

    if @task.save
      redirect_to project_path(@project), notice: "Task created successfully."
    else
      @task.errors.messages[:image].first
      flash.now[:notice] = "Task creation failed"
      render :new
    end
  end

  def change_status
    #debugger
    @task = Task.find(params[:id])
    if @task.aasm.fire!(params[:name])
      redirect_to request.referer, notice: "Status changed successfully."
    else
      redirect_to request.referer, notice: "Status changed failed"
    end
  end

  def show
    @project = Project.find(params[:project_id])
  end

  def edit

  end

  def update
    if  @project.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  # def find_project
  #   @project = Project.find(params[:project_id])
  # end

  def task_params
    params.require(:task).permit(:title, :description, :user_id, :status,:type, :image)
  end
end
