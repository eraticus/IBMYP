require 'test_helper'

class LprofilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lprofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lprofile" do
    assert_difference('Lprofile.count') do
      post :create, :lprofile => { }
    end

    assert_redirected_to lprofile_path(assigns(:lprofile))
  end

  test "should show lprofile" do
    get :show, :id => lprofiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lprofiles(:one).to_param
    assert_response :success
  end

  test "should update lprofile" do
    put :update, :id => lprofiles(:one).to_param, :lprofile => { }
    assert_redirected_to lprofile_path(assigns(:lprofile))
  end

  test "should destroy lprofile" do
    assert_difference('Lprofile.count', -1) do
      delete :destroy, :id => lprofiles(:one).to_param
    end

    assert_redirected_to lprofiles_path
  end
end
