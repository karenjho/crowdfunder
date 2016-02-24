class ProjectsController < ApplicationController

  skip_before_action :require_login, only: [:index, :show, :new]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(param[:id])
  end

  def create

    @project = Project.new

    if @project.save
      redirect_to projects_path, notice: "Project successfully created!"
    else
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end


  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :deadline,
                                    rewards_attributes: [:name, :description, :threshold, :quantity, :_destroy])
  end
end
