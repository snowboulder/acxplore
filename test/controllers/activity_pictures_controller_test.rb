require 'test_helper'

class ActivityPicturesControllerTest < ActionController::TestCase
  setup do
    @activity_picture = activity_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_picture" do
    assert_difference('ActivityPicture.count') do
      post :create, activity_picture: { activity_id: @activity_picture.activity_id, picture: @activity_picture.picture }
    end

    assert_redirected_to activity_picture_path(assigns(:activity_picture))
  end

  test "should show activity_picture" do
    get :show, id: @activity_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_picture
    assert_response :success
  end

  test "should update activity_picture" do
    patch :update, id: @activity_picture, activity_picture: { activity_id: @activity_picture.activity_id, picture: @activity_picture.picture }
    assert_redirected_to activity_picture_path(assigns(:activity_picture))
  end

  test "should destroy activity_picture" do
    assert_difference('ActivityPicture.count', -1) do
      delete :destroy, id: @activity_picture
    end

    assert_redirected_to activity_pictures_path
  end
end
