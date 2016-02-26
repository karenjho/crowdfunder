require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @user = FactoryGirl.create(:user)

    login_user(user = @user, route = login_url)  # replace with your login url path
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
  test "post create fails with empty params" do
    post :create, project: {}
    assert_response :error
  end

  test "post create adds dummy reward with threshold 1" do
    post :create, project: FactoryGirl.attributes_for(:project)
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
