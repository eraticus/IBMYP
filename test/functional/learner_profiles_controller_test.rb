require 'test_helper'

class LearnerProfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learner_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learner_profile" do
    assert_difference('LearnerProfile.count') do
      post :create, :learner_profile => { }
    end

    assert_redirected_to learner_profile_path(assigns(:learner_profile))
  end

  test "should show learner_profile" do
    get :show, :id => learner_profiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => learner_profiles(:one).to_param
    assert_response :success
  end

  test "should update learner_profile" do
    put :update, :id => learner_profiles(:one).to_param, :learner_profile => { }
    assert_redirected_to learner_profile_path(assigns(:learner_profile))
  end

  test "should destroy learner_profile" do
    assert_difference('LearnerProfile.count', -1) do
      delete :destroy, :id => learner_profiles(:one).to_param
    end

    assert_redirected_to learner_profiles_path
  end
end
