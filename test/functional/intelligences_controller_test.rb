require 'test_helper'

class IntelligencesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intelligences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intelligence" do
    assert_difference('Intelligence.count') do
      post :create, :intelligence => { }
    end

    assert_redirected_to intelligence_path(assigns(:intelligence))
  end

  test "should show intelligence" do
    get :show, :id => intelligences(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => intelligences(:one).to_param
    assert_response :success
  end

  test "should update intelligence" do
    put :update, :id => intelligences(:one).to_param, :intelligence => { }
    assert_redirected_to intelligence_path(assigns(:intelligence))
  end

  test "should destroy intelligence" do
    assert_difference('Intelligence.count', -1) do
      delete :destroy, :id => intelligences(:one).to_param
    end

    assert_redirected_to intelligences_path
  end
end
