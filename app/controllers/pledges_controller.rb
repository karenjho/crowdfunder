class PledgesController < ApplicationController

  before_action :load_project, only: [:create]
  before_action :load_pledge, only: [:edit, :update, :destroy]

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = @project.pledges.build(pledge_params)
    @pledge.user = current_user

    if @pledge.save
      redirect_to project_path(@project), notice: "Thank you for your pledge!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pledge.update_attributes(pledge_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @pledge.destroy
    redirect_to user_path(current_user)
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def load_pledge
    @pledge = Pledge.find(params[:id])
  end
end
