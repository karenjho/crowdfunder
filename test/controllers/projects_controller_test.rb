require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    # login method with sorcery? look up sorcery testing for log in/session creation
  end
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end
  #
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end
  #
  # test "post create fails with empty params" do
  #   post :create, params: {}
  #   assert_response :failure
  # end

  test "post create adds reward with threshold 1" do
    post :create, params: FactoryGirl.attributes_for(:project)
    assert_equal( Project.last.rewards.first.threshold, 1 )
  end
  #
  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end
  #
  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
