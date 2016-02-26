require 'test_helper'

class PledgeTest < ActiveSupport::TestCase

  setup do
    @pledge = FactoryGirl.create(:pledge)
    @reward = FactoryGirl.create(:reward)
  end

  test "pledge amount is adequate if greater than reward threshold" do
    assert ( @pledge.amount >= @reward.threshold ) && ( @pledge.adequate_amount?(@reward) )
  end

end
