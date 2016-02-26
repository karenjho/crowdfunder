require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  setup do
    @project = FactoryGirl.create(:project)
  end

  # test "dummy reward created with threshold of 1" do
  #   assert_equal( @project.rewards.last.threshold, 1 )
  # end

end
