class RewardsController < ApplicationController

  before_action :load_project
  before_action :load_reward, only: [:edit, :update, :destroy]

  def new
    @reward = Reward.new
  end

  def create
    @reward = @project.rewards.build(reward_params)

    if @reward.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reward.update_attributes(reward_params)

    if @reward.save
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @reward.destroy
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :description, :threshold, :quantity)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def load_reward
    @reward = Reward.find(params[:id])
  end
end
