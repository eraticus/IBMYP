require 'test_helper'

class ObjectivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objectives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create objective" do
    assert_difference('Objective.count') do
      post :create, :objective => { }
    end

    assert_redirected_to objective_path(assigns(:objective))
  end

  test "should show objective" do
    get :show, :id => objectives(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => objectives(:one).to_param
    assert_response :success
  end

  test "should update objective" do
    put :update, :id => objectives(:one).to_param, :objective => { }
    assert_redirected_to objective_path(assigns(:objective))
  end

  test "should destroy objective" do
    assert_difference('Objective.count', -1) do
      delete :destroy, :id => objectives(:one).to_param
    end

    assert_redirected_to objectives_path
  end
end
