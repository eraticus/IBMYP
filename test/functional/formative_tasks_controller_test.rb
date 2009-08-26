require 'test_helper'

class FormativeTasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formative_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formative_task" do
    assert_difference('FormativeTask.count') do
      post :create, :formative_task => { }
    end

    assert_redirected_to formative_task_path(assigns(:formative_task))
  end

  test "should show formative_task" do
    get :show, :id => formative_tasks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => formative_tasks(:one).to_param
    assert_response :success
  end

  test "should update formative_task" do
    put :update, :id => formative_tasks(:one).to_param, :formative_task => { }
    assert_redirected_to formative_task_path(assigns(:formative_task))
  end

  test "should destroy formative_task" do
    assert_difference('FormativeTask.count', -1) do
      delete :destroy, :id => formative_tasks(:one).to_param
    end

    assert_redirected_to formative_tasks_path
  end
end
