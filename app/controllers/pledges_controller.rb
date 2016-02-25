class PledgesController < ApplicationController

  before_action :load_reward
  before_action :load_project, only: [:create]
  before_action :load_pledge, only: [:edit, :update, :destroy]

  def new
    @pledge = Pledge.new
    @reward = Reward.find(params[:reward_id])
  end

  def create
    @pledge = @reward.pledges.build(pledge_params)
    @pledge.user = current_user


    if @reward.quantity_available?

      if @pledge.adequate_amount?
        @pledge.save
        redirect_to project_path(@project), notice: "Thank you for your pledge!"
      else
        flash[:alert] = "Sorry, you must pledge at least $#{@reward.threshold} to receive this reward."
        render :new
      end

    else
      flash[:alert] = "Sorry, this reward is sold out."
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
    @project = @reward.project
  end

  def load_pledge
    @pledge = Pledge.find(params[:id])
  end

  def load_reward
    @reward = Reward.find(params[:reward_id])
  end
end
