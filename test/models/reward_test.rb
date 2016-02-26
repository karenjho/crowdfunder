require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test "dummy_attrs method contains hash with quantity of 9999" do
    assert_equal( 9999, Reward.dummy_attrs[:quantity] )
  end

  test "dummy_attrs method contains hash with threshold of 1" do
    assert_equal( 1, Reward.dummy_attrs[:threshold] )
  end

end
