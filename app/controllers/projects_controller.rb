class ProjectsController < ApplicationController

  skip_before_action :require_login, only: [:index, :show, :new]

  def index
    @projects = Project.all
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
    @pledges = @project.pledges
    @goal = @project.goal
  end

  def new
    @project = Project.new
    @categories = Category.all.map do |c|
      [c.name,c.id]
    end
  end

  def edit
    @project = Project.find(params[:id])
    @categories = Category.all.map do |c|
      [c.name,c.id]
    end
  end

  def create
    @project = Project.new(project_params)
    @project.rewards.build(Reward.dummy_attrs)
    @project.creator = current_user

    if @project.save
      redirect_to projects_path, notice: "Project successfully created!"
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end


  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :end_date, :creator_id, :category_id,
                                    rewards_attributes: [:id, :name, :description, :threshold, :quantity, :_destroy])

  end
end
