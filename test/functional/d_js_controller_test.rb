require 'test_helper'

class DJsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:djs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dj" do
    assert_difference('DJ.count') do
      post :create, :dj => { }
    end

    assert_redirected_to dj_path(assigns(:dj))
  end

  test "should show dj" do
    get :show, :id => djs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => djs(:one).to_param
    assert_response :success
  end

  test "should update dj" do
    put :update, :id => djs(:one).to_param, :dj => { }
    assert_redirected_to dj_path(assigns(:dj))
  end

  test "should destroy dj" do
    assert_difference('DJ.count', -1) do
      delete :destroy, :id => djs(:one).to_param
    end

    assert_redirected_to djs_path
  end
end
