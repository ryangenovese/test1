require 'test_helper'

class DevneedsControllerTest < ActionController::TestCase
  setup do
    @devneed = devneeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devneeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create devneed" do
    assert_difference('Devneed.count') do
      post :create, devneed: { description: @devneed.description, title: @devneed.title }
    end

    assert_redirected_to devneed_path(assigns(:devneed))
  end

  test "should show devneed" do
    get :show, id: @devneed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @devneed
    assert_response :success
  end

  test "should update devneed" do
    patch :update, id: @devneed, devneed: { description: @devneed.description, title: @devneed.title }
    assert_redirected_to devneed_path(assigns(:devneed))
  end

  test "should destroy devneed" do
    assert_difference('Devneed.count', -1) do
      delete :destroy, id: @devneed
    end

    assert_redirected_to devneeds_path
  end
end
