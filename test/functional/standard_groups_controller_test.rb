require 'test_helper'

class StandardGroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standard_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standard_group" do
    assert_difference('StandardGroup.count') do
      post :create, :standard_group => { }
    end

    assert_redirected_to standard_group_path(assigns(:standard_group))
  end

  test "should show standard_group" do
    get :show, :id => standard_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => standard_groups(:one).to_param
    assert_response :success
  end

  test "should update standard_group" do
    put :update, :id => standard_groups(:one).to_param, :standard_group => { }
    assert_redirected_to standard_group_path(assigns(:standard_group))
  end

  test "should destroy standard_group" do
    assert_difference('StandardGroup.count', -1) do
      delete :destroy, :id => standard_groups(:one).to_param
    end

    assert_redirected_to standard_groups_path
  end
end
