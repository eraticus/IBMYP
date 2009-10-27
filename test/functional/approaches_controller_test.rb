require 'test_helper'

class ApproachesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approaches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approach" do
    assert_difference('Approach.count') do
      post :create, :approach => { }
    end

    assert_redirected_to approach_path(assigns(:approach))
  end

  test "should show approach" do
    get :show, :id => approaches(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => approaches(:one).to_param
    assert_response :success
  end

  test "should update approach" do
    put :update, :id => approaches(:one).to_param, :approach => { }
    assert_redirected_to approach_path(assigns(:approach))
  end

  test "should destroy approach" do
    assert_difference('Approach.count', -1) do
      delete :destroy, :id => approaches(:one).to_param
    end

    assert_redirected_to approaches_path
  end
end
