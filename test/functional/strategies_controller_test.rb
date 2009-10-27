require 'test_helper'

class StrategiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:strategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create strategy" do
    assert_difference('Strategy.count') do
      post :create, :strategy => { }
    end

    assert_redirected_to strategy_path(assigns(:strategy))
  end

  test "should show strategy" do
    get :show, :id => strategies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => strategies(:one).to_param
    assert_response :success
  end

  test "should update strategy" do
    put :update, :id => strategies(:one).to_param, :strategy => { }
    assert_redirected_to strategy_path(assigns(:strategy))
  end

  test "should destroy strategy" do
    assert_difference('Strategy.count', -1) do
      delete :destroy, :id => strategies(:one).to_param
    end

    assert_redirected_to strategies_path
  end
end
