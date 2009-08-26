require 'test_helper'

class SummativeTasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:summative_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create summative_task" do
    assert_difference('SummativeTask.count') do
      post :create, :summative_task => { }
    end

    assert_redirected_to summative_task_path(assigns(:summative_task))
  end

  test "should show summative_task" do
    get :show, :id => summative_tasks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => summative_tasks(:one).to_param
    assert_response :success
  end

  test "should update summative_task" do
    put :update, :id => summative_tasks(:one).to_param, :summative_task => { }
    assert_redirected_to summative_task_path(assigns(:summative_task))
  end

  test "should destroy summative_task" do
    assert_difference('SummativeTask.count', -1) do
      delete :destroy, :id => summative_tasks(:one).to_param
    end

    assert_redirected_to summative_tasks_path
  end
end
