require 'test_helper'

class PledgeTest < ActiveSupport::TestCase

  setup do
    @pledge = FactoryGirl.create(:pledge)
    @pledge_of_5 = FactoryGirl.create(:pledge_of_5)
    @pledge_of_50 = FactoryGirl.create(:pledge_of_50)
    @pledge_of_5000 = FactoryGirl.create(:pledge_of_5000)

    @reward = FactoryGirl.create(:reward)
    @reward_with_10_threshold = FactoryGirl.create(:reward_with_10_threshold)
    @reward_with_2000_threshold = FactoryGirl.create(:reward_with_2000_threshold)
  end

  test "pledge amount is adequate if greater than reward threshold" do
    assert_equal( @pledge.amount >= @reward.threshold, @pledge.adequate_amount?(@reward) )
  end

  test "small pledge is not enough to meet reward threshold" do
    assert_not( @pledge_of_5.adequate_amount?(@reward_with_10_threshold) )
  end

  test "large pledge is enough to meet large reward threshold" do
    assert( @pledge_of_5000.adequate_amount?(@reward_with_2000_threshold) )
  end

  test "medium pledge is enough to meet small reward threshold" do
    assert( @pledge_of_50.adequate_amount?(@reward_with_10_threshold) )
  end

  test "medium pledge is not enough to meet large reward threshold" do
    assert_not( @pledge_of_50.adequate_amount?(@reward_with_2000_threshold) )
  end

end
