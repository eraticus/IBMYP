require 'test_helper'

class UnitPlannersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_planners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_planner" do
    assert_difference('UnitPlanner.count') do
      post :create, :unit_planner => { }
    end

    assert_redirected_to unit_planner_path(assigns(:unit_planner))
  end

  test "should show unit_planner" do
    get :show, :id => unit_planners(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unit_planners(:one).to_param
    assert_response :success
  end

  test "should update unit_planner" do
    put :update, :id => unit_planners(:one).to_param, :unit_planner => { }
    assert_redirected_to unit_planner_path(assigns(:unit_planner))
  end

  test "should destroy unit_planner" do
    assert_difference('UnitPlanner.count', -1) do
      delete :destroy, :id => unit_planners(:one).to_param
    end

    assert_redirected_to unit_planners_path
  end
end
