require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase

  def setup
    @admin     = users(:lelouch)
    @non_admin = users(:suzaku)
    @activity  = activities(:bouldering)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect activity edit when not logged in" do
    get :edit, id: @activity
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect activity update when not logged in" do
    patch :update, id: @activity, activity: { name: @activity.name,
                                               season: @activity.season }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect activity edit when logged in as non admin" do
  log_in_as(@non_admin)
  get :edit, id: @activity
  assert flash.empty?
  assert_redirected_to root_url
  end

  test "should redirect acivity update when logged in as non admin" do
    log_in_as(@non_admin)
    patch :update, id: @activity, activity: { name: @activity.name,
                                              season: @activity.season }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect activity index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should redirect activity destroy when not logged in" do
    assert_no_difference 'Activity.count' do
      delete :destroy, id: @activity
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@non_admin)
    assert_no_difference 'Activity.count' do
      delete :destroy, id: @activity
    end
    assert_redirected_to root_url
  end

end
