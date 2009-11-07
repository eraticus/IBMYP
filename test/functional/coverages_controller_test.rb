require 'test_helper'

class CoveragesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coverages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coverage" do
    assert_difference('Coverage.count') do
      post :create, :coverage => { }
    end

    assert_redirected_to coverage_path(assigns(:coverage))
  end

  test "should show coverage" do
    get :show, :id => coverages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => coverages(:one).to_param
    assert_response :success
  end

  test "should update coverage" do
    put :update, :id => coverages(:one).to_param, :coverage => { }
    assert_redirected_to coverage_path(assigns(:coverage))
  end

  test "should destroy coverage" do
    assert_difference('Coverage.count', -1) do
      delete :destroy, :id => coverages(:one).to_param
    end

    assert_redirected_to coverages_path
  end
end
