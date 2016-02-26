require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  setup do
    @project = FactoryGirl.create(:project)
    @project_low_goal = FactoryGirl.create(:project_low_goal)
  end

  # test "dummy reward created with threshold of 1" do
  #   assert_equal( @project.rewards.last.threshold, 1 )
  # end

  test "goal achieved when pledge sum exceeds it" do
    assert( @project_low_goal.goal_achieved?(200) )
  end

  test "goal is not achieved when pledge sum is smaller than it" do
    assert_not( @project.goal_achieved?(200) )
  end

  test "goal is not achieved when pledge sum is zero" do
    assert_not( @project.goal_achieved?(0) )
  end

end
